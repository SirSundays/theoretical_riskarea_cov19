var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var mysql = require('mysql');
const request = require('request');
const csv = require('csvtojson');

var pool = mysql.createPool({
  connectionLimit: 10000,
  host: 'localhost',
  user: 'root',
  password: 'covid',
  database: 'covid'
});

var dataRouter = require('./routes/data');

var app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, 'pages')));

app.use('/data', dataRouter);

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.json({
    message: err.message,
    error: err
  });
});

convDateFunc = function (date) {
      date_year = date.toString().slice(0, 4);
      date_month = date.toString().slice(5, 7);
      date_day = date.toString().slice(8, 10);
      nextDate = date_month + "-" + date_day + "-" + date_year;
      return nextDate;
}

setInterval(function () {
console.log("Check for Updates...");
pool.query('SELECT MAX(date) AS next_date FROM next_dates', function (error, results, fields) {
  if (error) throw error;
    request('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/' + convDateFunc(results[0].next_date) + '.csv', function (error, response, body) {
      // console.error('error:', error); // Print the error if one occurred
      // console.log('statusCode:', response && response.statusCode); // Print the response status code if a response was received
      if (response.statusCode == 200) {
        console.log("New file available. Starting update. This takes a couple of seconds.");
        csv()
          .fromStream(request.get('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/' + convDateFunc(results[0].next_date) + '.csv'))
          .subscribe((json) => {
            return new Promise((resolve, reject) => {
              json.Last_Update = json.Last_Update.slice(0, 10);
              (json.Confirmed === '') ? json.Confirmed = 0 : json.Confirmed = parseInt(json.Confirmed, 10);
              (json.Deaths === '') ? json.Deaths = 0 : json.Deaths = parseInt(json.Deaths, 10);
              (json.Recovered === '') ? json.Recovered = 0 : json.Recovered = parseInt(json.Recovered, 10);
              (json.Active === '') ? json.Active = 0 : json.Active = parseInt(json.Active, 10);
              pool.query('INSERT INTO daily_reports(`province`, `country`, `last_update`, `confirmed`, `deaths`, `recovered`, `active`) VALUES (?,?,?,?,?,?,?)', [json.Province_State, json.Country_Region, json.Last_Update, json.Confirmed, json.Deaths, json.Recovered, json.Active], function (error, results) {
                if (error) {
                  reject();
                  throw error;
                }
                if (results) {
                  //console.log(json);
                  resolve();
                }
              });
            })
          }, onError, onComplete);
      } else {
        console.log("Probably no new file available.")
      }
    });
});
}, 30000);

onError = function () {
  console.log("Error. Could not update.");
}

onComplete = function () {
  pool.query('SELECT last_update FROM daily_reports ORDER BY last_update DESC LIMIT 50', function (error, results, fields) {
    if (error) throw error;
    if (results[results.length-1]) {
      pool.query('INSERT INTO next_dates(`date`) VALUES (?)', [results[0].last_update], function (error, results, fields) {
        if (error) throw error;
      });
    }
  });
  console.log("Database updated!");
}

module.exports = app;

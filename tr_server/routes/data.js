const { json } = require('express');
var express = require('express');
var router = express.Router();
var mysql = require('mysql');

const throwMysqlErr = false;

var pool = mysql.createPool({
  connectionLimit: 100,
  host: 'localhost',
  user: 'root',
  password: 'covid',
  database: 'covid'
});

errFunc = function (err) {
  if (err && throwMysqlErr) {
    throw err;
  } else if (err) {
    console.warn(err);
  }
}

dayAbsToRel = function (absolute) {
  var realtive = [];
  for (var i = 0; i < absolute.length; i++) {
    if (i < absolute.length - 1) {
      realtive[i] = absolute[i] - absolute[i + 1];
    }
  };
  return realtive;
}

convertDaysToWhere = function (dates) {
  // return a string which then can be added to a WHERE Clause of a SQL-Query
  // AND last_update = '2020-10-15' AND last_update ...
  var where = '(';
  const additiveBegin = "last_update = '";
  const additiveOperand = 'OR ';
  const additiveEnd = "' ";
  dates.forEach((date, index) => {
    if (index == 0) {
      where += additiveBegin + date.date + additiveEnd;
    } else {
      where += additiveOperand + additiveBegin + date.date + additiveEnd;
    }
  });
  where += ')';
  return where;
}

getAllDistinctCountries = function (resume) {
  pool.query('SELECT country, code FROM country_codes', function (error, results, fields) {
    errFunc(error);
    resume(results);
  });
}

getAllDistinctProvincesByCountries = function (countryString, resume) {
  pool.query('SELECT DISTINCT province FROM population WHERE country = ? AND population > 0 ', [countryString], function (error, results, fields) {
    errFunc(error);
    resume(results);
  });
}

getSpecificCountry = async function (countryString, provinceString, incidenceDays, day, resume) {
  // SELECT confirmed FROM daily_reports WHERE country = "Germany" AND last_update IN (SELECT date AS last_update FROM next_dates ORDER BY date DESC LIMIT 8)
  // doesnt work because of MariaDB Error 1235 (you cannot combine WHERE IN and LIMIT)
  pool.query('SELECT * FROM next_dates WHERE date < "' + day + '" ORDER BY date DESC LIMIT ' + incidenceDays, function (error, results, fields) {
    errFunc(error);
    let dates = convertDaysToWhere(results);
    let locationString = "";
    if (provinceString === '-') {
      locationString = 'country = "' + countryString + '"';
    } else {
      locationString = 'province = "' + provinceString + '"';
    }
    pool.query('SELECT SUM(confirmed) AS confirmed FROM daily_reports WHERE ' + locationString + ' AND ' + dates + ' GROUP BY last_update ORDER BY last_update DESC;', function (err, resultsDate, fields) {
      errFunc(err);
      let lastWeekConfirmedAbs = [];
      for (let i = 0; i < resultsDate.length; i++) {
        lastWeekConfirmedAbs[i] = resultsDate[i].confirmed;
      }
      let lastWeekConfirmedRel = dayAbsToRel(lastWeekConfirmedAbs);
      let lastWeekConfirmed = 0;
      for (let i = 0; i < lastWeekConfirmedRel.length; i++) {
        lastWeekConfirmed += lastWeekConfirmedRel[i];
      }
      pool.query('SELECT SUM(population) AS population FROM population WHERE ' + locationString, function (error, resultPop) {
        errFunc(error);
        resume(lastWeekConfirmed / resultPop[0].population * 100000);
      });
    });
  });
}

// GET available dates
router.get('/availableDates', function (req, res, next) {
  pool.query('SELECT * FROM `next_dates` ORDER BY date', function (error, results, fields) {
    errFunc(error);
    res.send(results.slice(8, results.length));
  });
});

// GET newest date
router.get('/newestDate', function (req, res, next) {
  pool.query('SELECT MAX(date) AS date FROM `next_dates`', function (error, results, fields) {
    errFunc(error);
    res.send(results[0].date);
  });
});

// GET every country
router.get('/distinctCountries', function (req, res, next) {
  getAllDistinctCountries((results) => {
    res.send(results);
  });
});

// GET every province of country
router.get('/distinctProvince/:countryString', function (req, res, next) {
  getAllDistinctProvincesByCountries(req.params.countryString, (results) => {
    res.send(results);
  });
});

// GET current incidence of specific country
router.get('/specificCountries/:countryString/:province/:incidenceDays/:day', async function (req, res, next) {
  getSpecificCountry(req.params.countryString, req.params.province, parseInt(req.params.incidenceDays) + 1, req.params.day, (results) => {
    res.json({
      'incidenceRate': results
    });
  });
});

// GET current incidence of all countries
router.get('/allCountries/:incidenceDays/:day', async function (req, res, next) {
  let jsonOut = {};
  // Is this dirty? Yes. But it works (if good performance actually). In the future I have to look into using Promises for this.
  let resultsCount = 0;
  getAllDistinctCountries((results) => {
    results.forEach(country => {
      getSpecificCountry(country.country, "-", parseInt(req.params.incidenceDays) + 1, req.params.day, (result) => {
        jsonOut[country.code] = {'incidenceRateVal': parseFloat(result).toFixed(2)};
        resultsCount++;
        if (resultsCount == results.length) {
          res.json(jsonOut);
        }
      });
    });
  });
});

module.exports = router;
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

// GET available dates
router.get('/availableDates', function(req, res, next) {
  pool.query('SELECT * FROM `next_dates` ORDER BY date', function (error, results, fields) {
    errFunc(error);
    res.send(results.slice(6, results.length));
  });
});

// GET newest date
router.get('/newestDate', function(req, res, next) {
  pool.query('SELECT MAX(date) AS date FROM `next_dates`', function (error, results, fields) {
    errFunc(error);
    res.send(results[0].date);
  });
});

// GET every country
router.get('/distinctCountries', function(req, res, next) {
  pool.query('SELECT DISTINCT country FROM `population` WHERE population > 0', function (error, results, fields) {
    errFunc(error);
    res.send(results);
  });
});

// GET current 7 day incidence of specific country

module.exports = router;
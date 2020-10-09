const mysql = require('mysql');
const puppeteer = require("puppeteer");

// Create a connection pool for the database
var pool = mysql.createPool({
    connectionLimit: 100,
    host: 'localhost',
    user: 'root',
    password: 'covid',
    database: 'covid'
});

// If an error occurs when inserting into the db, should the error be thrown or just insert -1 for it
const throwMysqlErr = false;

// Is there a '.' or a ',' if you google a province with a population below a million
// If you google a country with more than a million citizens what is the translation of million after the number
var unit = {
    thousandDot: '.',
    million: 'Millionen',
}

async function scrap(countryString) {
    // Launch a new puppeteer instance and search for the population number of google
    // Google sometimes gives only a rough estimate but this is fine for an overview
    const browser = await puppeteer.launch({
        headless: true,
        args: ["--disable-setuid-sandbox"],
        'ignoreHTTPSErrors': true
    });
    const page = await browser.newPage();
    await page.goto("https://www.google.com/search?q=" + countryString + "+population");

    const data = await page.evaluate(() => {
        // Basically google has two ways of showing the population number
        // One is just the number
        // The other one is with a graph
        // Because of that there are two different classes than can be looked at but only one works
        try {
            if (document.querySelector("div.ayqGOc.kno-fb-ctx.KBXm4e") != null && document.querySelector("div.ayqGOc.kno-fb-ctx.KBXm4e") != '') {
                const population = document.querySelector(
                    "div.ayqGOc.kno-fb-ctx.KBXm4e"
                ).innerText;
                return population;
            }
        } catch (err) {
            // console.log(err);
        }
        try {
            if (document.querySelector("div.Z0LcW.XcVN5d") != null && document.querySelector("div.Z0LcW.XcVN5d") != '') {
                const population = document.querySelector(
                    "div.Z0LcW.XcVN5d"
                ).innerText;
                return population;
            }
        } catch (err) {
            // console.log(err);
        }
    });
    await browser.close();

    console.log("Population of " + countryString.replace("+", " ") + ":");
    // console.log(data);

    var dataClean;
    try {
        // Split the read out data, sometimes there is something like a year included
        // The first part includes the number we need
        // The second most of the time a word like million (see the config value for it in the beginning)
        var dataSplit = data.split(' ');
        if (dataSplit[0].indexOf(unit.thousandDot) != -1) {
            // under a Million
            dataClean = dataSplit[0].replace(unit.thousandDot, '');
        } else {
            // above a Million
            if (dataSplit[0].indexOf(unit.million) != -1) {
                dataSplit[0] = dataSplit[0].replace(',', '.');
                dataClean = parseFloat(dataSplit[0].slice(0, dataSplit[0].indexOf(unit.million) - 1)) * 1000000;
            } else {
                dataSplit[0] = dataSplit[0].replace(',', '.');
                dataClean = parseFloat(dataSplit[0].slice(0, dataSplit[0].indexOf(unit.million) - 1)) * 1000000000;
            }
        }
        if (isNaN(dataClean) || dataClean > 1500000000) {
            // Clean out NaN values (on some occasions there is no or an other formated value read out)
            // Clean out values that are just to high to be true (1.5 Billion is greater than the population of both India and China)
            // all -1 values have later put in by hand unfortunatly
            dataClean = -1;
        }
        console.log(dataClean);
        return dataClean;
    } catch (err) {
        // console.log(err);
        // all -1 values have later put in by hand unfortunatly
        console.log("-1");
        return -1;
    }
}

async function startProcess() {
    pool.query('SELECT DISTINCT province, country FROM daily_reports', async function (err, results) {
        if (err) throw err; // This is only executes one in the beginning. So throwing here is necessary.
        // results = [{ province: '', country: 'Armenia' }, { province: 'New South Wales', country: 'Australia' }, { province: 'Henan', country: 'China' }]; // For Testing
        results.forEach(function (result, i) {
            setTimeout(async function () {
                // create the search string for google, it has to been watched out if its only a country or a province
                var countryString;
                if (result.province != '') {
                    countryString = result.province.replace(" ", "+") + "+" + result.country.replace(" ", "+");
                } else {
                    countryString = result.country.replace(" ", "+");
                }
                // get the population number from google
                var population = await scrap(countryString);
                // parse it again for safety
                population = parseInt(population);
                // Write it into the database
                pool.query('INSERT INTO population(country, province, population) VALUES (?,?,?)', [result.country, result.province, population], function (err, results) {
                    if (err) {
                        if (throwMysqlErr) {
                            throw err;
                        } else {
                            // if there was an error put in a -1
                            // all -1 values have later put in by hand unfortunatly
                            pool.query('INSERT INTO population(country, province, population) VALUES (?,?,?)', [result.country, result.province, -1], function (err, results) {
                                if (err) throw err;
                                // console.log(results);
                            });
                        }
                    }
                    // console.log(results);
                });
            }, i * 6000 - Math.ceil(Math.random() * 2500));
            // A searchquery is executed every 6 seconds minus a random number between 1 and 2500 ms. Necessary otherwise Google will block an IP address.
        });
    });
    return;
}

startProcess();
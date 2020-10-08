const mysql = require('mysql');
const puppeteer = require("puppeteer");

var unit = {
    thousandDot: '.',
    million: 'Millionen',
}

async function scrap(country) {
    const browser = await puppeteer.launch({
        headless: true,
        args: ["--disable-setuid-sandbox"],
        'ignoreHTTPSErrors': true
    });
    const page = await browser.newPage();
    await page.goto("https://www.google.com/search?q=china+population");

    const data = await page.evaluate(() => {
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

    console.log("Population: ");
    console.log(data);

    var dataClean;
    var dataSplit = data.split(' ');
    if (dataSplit[0].indexOf(unit.thousandDot) != -1) {
        // Under a Million
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
    console.log(dataClean);
    return dataClean;
}

scrap();
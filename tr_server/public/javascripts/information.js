const url = 'localhost:3000';
const logging = true;

var newestDate = '';
var incidenceSwitch = true;

$(document).ready(() => {
    $.ajax({
        url: "/data/newestDate",
        success: function (result) {
            logToConsole("Newest Date: " + result);
            newestDate = result;
            $("#newestDate").html(result);

            $.ajax({
                url: "/data/allCountries/7/" + newestDate,
                success: function (result) {
                    // console.table(result);
                    logToConsole("All Country Data: " + result);
                    new svgMap({
                        targetElementID: 'svgMap',
                        data: {
                            data: {
                                incidenceRateVal: {
                                    name: 'Incidence Rate',
                                    format: '{0} per 100.000 people per 7 days',
                                    thousandSeparator: '',
                                    thresholdMax: 50,
                                    thresholdMin: 0
                                }
                            },
                            applyData: 'incidenceRateVal',
                            values: result
                        },
                        countries: {
                            "EH": true
                        }
                    });
                }
            });
        }
    });
});


logToConsole = function (text) {
    if (logging) console.log(text);
}
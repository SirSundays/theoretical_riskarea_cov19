const url = 'localhost:3000';
const logging = true;

$(document).ready(() => {
    $.ajax({
        url: "/data/newestDate",
        success: function (result) {
            // logToConsole(result);
            $("#date").html(result);
        }
    });
});


logToConsole = function (text) {
    if (logging) console.log(text);
}
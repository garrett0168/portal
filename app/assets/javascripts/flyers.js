// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(window).scroll(function () {
    var scrollTop = $(window).scrollTop();
    if (scrollTop < 200) {
        maxHeight = 150;
    } else if (scrollTop > 400) {
        maxHeight = 75;
    } else {
        maxHeight = 150 - 75 * ((scrollTop - 200)) / 200;
    }
    $('#hero').css({
        'max-height': maxHeight + "px"
    });
})
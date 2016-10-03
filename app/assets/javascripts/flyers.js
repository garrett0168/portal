// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(window).scroll(function() {
if ($(this).scrollTop() > 190){  
    $('#hero-wrap').addClass("smaller");
  }
  else{
    $('#hero-wrap').removeClass("smaller");
  }
});
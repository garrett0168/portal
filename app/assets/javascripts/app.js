$(window).scroll(function() {
if ($(this).scrollTop() > 200){  
    $('#hero-wrap').addClass("smaller");
  }
  else{
    $('#hero-wrap').removeClass("smaller");
  }
});
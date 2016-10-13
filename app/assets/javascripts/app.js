$(window).scroll(function() {
  if ($(this).scrollTop() > 200){ 
    $('.hero-wrap-js').addClass("smaller");
  }
  else{
    $('.hero-wrap-js').removeClass("smaller");
  }
});
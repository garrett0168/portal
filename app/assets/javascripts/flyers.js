<<<<<<< HEAD
// $(function(){

//   $('#masonry-container').masonry({
//     itemSelector: '.thumb',
// 	  // set columnWidth a fraction of the container width
//     columnWidth: function( containerWidth ) {
//       return containerWidth / 6;
//     }
//   });

// });
=======
$(function(){

  var $container = $('#masonry-container');
  $container.imagesLoaded( function() {

    $container.masonry({
        itemSelector : '.thumb'
    });    
  });

});
>>>>>>> 52048f593ad181b236a7abcd3be455baf7bd4d34

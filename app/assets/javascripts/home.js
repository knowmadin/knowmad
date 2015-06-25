$(document).ready(function(){
  $('section[data-type="background"]').each(function(){
    var $backgroundObject = $(this),
      $window = $(window);

    $window.scroll(function() {
      var yPos = -($window.scrollTop() / $backgroundObject.data('speed'));

      var coordinates = '50% '+ yPos + 'px';

      $backgroundObject.css({ backgroundPosition: coordinates });
    });
  });
});
$(document).ready(function() {
  L.mapbox.accessToken = 'pk.eyJ1IjoidmttaXRhIiwiYSI6IjE1ZWZiZDhhMTI1NzJjMTA2ZWRhOGRmOTBkYTJmOTRlIn0.UQVq8Xf_O6V1G8eFCRU3SQ';
  var map = L.mapbox.map('map', 'vkmita.0770a998');

  map.on('mousemove click', function(e) {
    console.log(e.containerPoint.toString() + ', ' + e.latlng.toString())
  });
});

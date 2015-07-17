$(document).ready(function() {
  L.mapbox.accessToken = 'pk.eyJ1IjoidmttaXRhIiwiYSI6IjE1ZWZiZDhhMTI1NzJjMTA2ZWRhOGRmOTBkYTJmOTRlIn0.UQVq8Xf_O6V1G8eFCRU3SQ';

  var map = L.mapbox.map('map', 'vkmita.0770a998'),
      geocoder = L.mapbox.geocoder('mapbox.places'),
      numberOfClicks = 0;

  map.on('click', click);

  function click(e) {
    if (numberOfClicks === 0) {
      setTimeout(reaction.bind(this, e, geocoder), 500);
    }

    numberOfClicks = numberOfClicks + 1;
  }

  function reaction(e, geocoder) {
    if (numberOfClicks === 1) {
      debugger;
      console.log(e.latlng)
    } else {
      console.log(numberOfClicks.toString())
    }

    numberOfClicks = 0;
  }
});

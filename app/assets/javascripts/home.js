$(document).ready(function() {
  L.mapbox.accessToken = 'pk.eyJ1IjoidmttaXRhIiwiYSI6IjE1ZWZiZDhhMTI1NzJjMTA2ZWRhOGRmOTBkYTJmOTRlIn0.UQVq8Xf_O6V1G8eFCRU3SQ';

  var map = L.mapbox.map('map', 'vkmita.0770a998'),
      numberOfClicks = 0;

  map.on('click', click);

  function click(e) {
    debugger;
    if (numberOfClicks === 0) {
      setTimeout(reaction.bind(this, e), 200);
    }

    numberOfClicks = numberOfClicks + 1;
  }

  function reaction(e) {
    debugger;
    if (numberOfClicks === 1) {
      console.log(e.containerPoint.toString() + ', ' + e.latlng.toString())
    } else {
      console.log(numberOfClicks.toString())
    }

    numberOfClicks = 0;
  }
});

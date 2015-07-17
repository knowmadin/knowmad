if ($('#map')) {
  $(document).ready(function() {
    L.mapbox.accessToken = 'pk.eyJ1IjoidmttaXRhIiwiYSI6IjE1ZWZiZDhhMTI1NzJjMTA2ZWRhOGRmOTBkYTJmOTRlIn0.UQVq8Xf_O6V1G8eFCRU3SQ';

    var map = L.mapbox.map('map', 'vkmita.0770a998'),
      numberOfClicks = 0;

    map.on('click', click);

    function click(e) {
      if (numberOfClicks === 0) {
        setTimeout(reaction.bind(this, e, geocoder, map), 500);
      }

      numberOfClicks = numberOfClicks + 1;
    }

    function reaction(e, geocoder, map) {
      if (numberOfClicks === 1) {
        var googleGeocodeApiUrl = 'https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyCTcnA2Fr6ZH97xLLN94J5tIP3Rab_HyQ4&latlng=' + e.latlng.lat.toString() + ',' + e.latlng.lng.toString();

        $.ajax({
          url: googleGeocodeApiUrl
        }).done(function(json) {
          json;
        });
      } else {
        console.log(numberOfClicks.toString())
      }

      numberOfClicks = 0;
    }
  });
}
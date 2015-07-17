if ($('#map')) {
  $(document).ready(function() {
    L.mapbox.accessToken = 'pk.eyJ1IjoidmttaXRhIiwiYSI6IjE1ZWZiZDhhMTI1NzJjMTA2ZWRhOGRmOTBkYTJmOTRlIn0.UQVq8Xf_O6V1G8eFCRU3SQ';

    var map = L.mapbox.map('map', 'vkmita.0770a998'),
      geocoder = L.mapbox.geocoder('mapbox.places'),
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
        geocoder.reverseQuery(e.latlng, function(err, result) {
          if (err) {
            alert('oops something went wrong with getting the location' + err.toString());
          } else {
            var context = result.features[0].context;
            for (var i = 0, l = context.length; i < l; i++) {
              console.log(context[i]);
            }

            var googleGeocodeApiUrl = 'https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyCTcnA2Fr6ZH97xLLN94J5tIP3Rab_HyQ4&latlng=' + e.latlng.lat.toString() + ',' + e.latlng.lng.toString();

            $.ajax({
              url: googleGeocodeApiUrl
            }).done(function(json) {
              console.log(json);
            });
          }
        })
      } else {
        console.log(numberOfClicks.toString())
      }

      numberOfClicks = 0;
    }
  });
}
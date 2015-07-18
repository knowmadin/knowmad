if ($('#map')) {
  $(document).ready(function() {
    L.mapbox.accessToken = 'pk.eyJ1IjoidmttaXRhIiwiYSI6IjE1ZWZiZDhhMTI1NzJjMTA2ZWRhOGRmOTBkYTJmOTRlIn0.UQVq8Xf_O6V1G8eFCRU3SQ';

    var map = L.mapbox.map('map', 'vkmita.0770a998'),
      numberOfClicks = 0;

    map.on('click', click);

    function click(e) {
      if (numberOfClicks === 0) {
        setTimeout(reaction.bind(this, e, map), 500);
      }

      numberOfClicks = numberOfClicks + 1;
    }

    function reaction(e, map) {
      if (numberOfClicks === 1) {
        map.setView([e.latlng.lat, e.latlng.lng], map.getZoom());

        var googleGeocodeApiUrl = 'https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyCTcnA2Fr6ZH97xLLN94J5tIP3Rab_HyQ4&latlng=' + e.latlng.lat.toString() + ',' + e.latlng.lng.toString();

        $.ajax({
          url: googleGeocodeApiUrl
        }).done(function(json) {
          var addresses = [];

          debugger;
          console.log(json.results);
          for (var i = 0, l = json.results.length ; i < l ; i++) {
            debugger;
            addresses.push([json.results[i].formatted_address, json.results[i]])
          }

          console.log(addresses);
        });
      } else {
        console.log(numberOfClicks.toString())
      }

      numberOfClicks = 0;
    }
  });
}
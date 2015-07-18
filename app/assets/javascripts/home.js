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

      map.setView([e.latlng.lat, e.latlng.lng], map.getZoom());
      numberOfClicks = numberOfClicks + 1;
    }

    function reaction(e, map) {
      if (numberOfClicks === 1) {
        var googleGeocodeApiUrl = 'https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyCTcnA2Fr6ZH97xLLN94J5tIP3Rab_HyQ4&latlng=' + e.latlng.lat.toString() + ',' + e.latlng.lng.toString();

        $.ajax({
          url: googleGeocodeApiUrl
        }).done(function(json) {
          var resultComponents = json.results[0].address_components,
            modalBody = '<ul>';

          for (var i = 0, l = resultComponents.length, politicalRegion; i < l; i++) {
            if (resultComponents[i].types.indexOf('political') >= 0) {
              console.log(resultComponents[i].types);
              switch (resultComponents[i].types[0]) {
                case 'neighborhood':
                  politicalRegion = 'neighborhood';
                case 'locality':
                  politicalRegion = 'city';
                case 'administrative_area_level_2':
                  politicalRegion = 'county';
                case 'administrative_area_level_1':
                  politicalRegion = 'state';
                case 'country':
                  politicalRegion = 'country';
              }

              modalBody += '<li>' + politicalRegion + ': ' + resultComponents[i].long_name + '</li>';
            }
          }

          $('.modal-body').append(modalBody + '</ul>');
          $('#address-modal').modal();
        });
      } else {
        console.log(numberOfClicks.toString());
      }

      numberOfClicks = 0;
    }
  });
}
if ($('#map')) {
  $(document).ready(function() {
    L.mapbox.accessToken = 'pk.eyJ1IjoidmttaXRhIiwiYSI6IjE1ZWZiZDhhMTI1NzJjMTA2ZWRhOGRmOTBkYTJmOTRlIn0.UQVq8Xf_O6V1G8eFCRU3SQ';

    var map = L.mapbox.map('map', 'vkmita.0770a998', {zoomControl: false}),
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
        var googleGeocodeApiUrl = 'https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyCTcnA2Fr6ZH97xLLN94J5tIP3Rab_HyQ4&latlng=' + e.latlng.lat.toString() + ',' + e.latlng.lng.toString();
        map.setView([e.latlng.lat, e.latlng.lng], map.getZoom());

        $.ajax({
          url: googleGeocodeApiUrl
        }).done(function(json) {
          console.log(json);

          var resultComponents = json.results[0].address_components,
            modalBody = '<ul class="list-group">';

          console.log(json.results);
          for (var i = 0, l = resultComponents.length, politicalRegion; i < l; i++) {
            if (resultComponents[i].types.indexOf('political') >= 0) {
              console.log(resultComponents[i].types);
              switch (resultComponents[i].types[0]) {
                case 'neighborhood':
                  politicalRegion = 'neighborhood';
                  break;
                case 'locality':
                  politicalRegion = 'city';
                  break;
                case 'administrative_area_level_2':
                  politicalRegion = 'county';
                  break;
                case 'administrative_area_level_1':
                  politicalRegion = 'state';
                  break;
                case 'country':
                  politicalRegion = 'country';
                  break;
                default:
                  politicalRegion = 'region';
              }

              modalBody += '<li class="list-group-item">' + resultComponents[i].long_name + '<span class="label label-primary pull-right">' + politicalRegion + '</span></li>';
            }
          }

          $('.address-components').html(modalBody + '</ul>');

          $('.modal .list-group .list-group-item').mouseover(function() {
            $(this).addClass('active')
              .nextAll('.list-group-item')
              .addClass('active');
          });

          $('.modal .list-group .list-group-item').mouseout(function() {
            $(this).removeClass('active')
              .nextAll('.list-group-item')
              .removeClass('active');
          });

          $('#address-modal').modal();
        });
      } else {
        console.log(numberOfClicks.toString());
      }

      numberOfClicks = 0;
    }
  });
}
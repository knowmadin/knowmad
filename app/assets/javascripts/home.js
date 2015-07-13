$(document).ready(function() {
  var map = $('#basic_choropleth').datamaps({
    projection: 'mercator',
    fills: {
      defaultFill: '#428bca'
    },
    geographyConfig: {
      highlightFillColor: '#357ebd',
      highlightBorderColor: 'rgba(253, 253, 253)'
    }
  });

  $(window).on('resize', function() {
    map.resize();
  });
});

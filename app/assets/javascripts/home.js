$(document).ready(function() {
  new Datamap({
    element: document.getElementById('basic_choropleth'),
    projection: 'mercator',
    fills: {
      defaultFill: '#428bca'
    },
    geographyConfig: {
      highlightFillColor: '#357ebd',
      highlightBorderColor: 'rgba(253, 253, 253)'
    }
  });

  d3.scale.category10();
});

$(document).ready(function() {
  var basic_choropleth = new Datamap({
    element: document.getElementById("basic_choropleth"),
    projection: 'mercator',
    fills: {
      defaultFill: "#428bca"
    },
    geographyConfig: {
      highlightFillColor: '#357ebd'
    }
  });

  d3.scale.category10();
});
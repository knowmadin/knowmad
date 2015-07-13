$(document).ready(function() {
  debugger;

  var basic_choropleth = new Datamap({
    element: document.getElementById("basic_choropleth"),
    projection: 'mercator',
    fills: {
      defaultFill: "#428bca"
    }
  });

  var colors = d3.scale.category10();
});
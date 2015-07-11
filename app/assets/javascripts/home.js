var basic_choropleth = new Datamap({
  element: document.getElementById("basic_choropleth"),
  projection: 'mercator',
  fills: {
    defaultFill: "#ABDDA4",
    authorHasTraveledTo: "#fa0fa0"
  },
  data: {
    USA: { fillKey: "authorHasTraveledTo" },
    JPN: { fillKey: "authorHasTraveledTo" },
    ITA: { fillKey: "authorHasTraveledTo" },
    CRI: { fillKey: "authorHasTraveledTo" },
    KOR: { fillKey: "authorHasTraveledTo" },
    DEU: { fillKey: "authorHasTraveledTo" }
  }
});

var colors = d3.scale.category10();

window.setInterval(function() {
  basic_choropleth.updateChoropleth({
    USA: colors(Math.random() * 10),
    RUS: colors(Math.random() * 100),
    AUS: { fillKey: 'authorHasTraveledTo' },
    BRA: colors(Math.random() * 50),
    CAN: colors(Math.random() * 50),
    ZAF: colors(Math.random() * 50),
    IND: colors(Math.random() * 50),
  });
}, 2000);
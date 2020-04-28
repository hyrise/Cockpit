// in custom-plotly.js
var Plotly = require("plotly.js/lib/core");

// Load in the trace types for pie, and choropleth
Plotly.register([
  require("plotly.js/lib/scatter"),
  require("plotly.js/lib/bar"),
  require("plotly.js/lib/heatmap"),
  require("plotly.js/lib/treemap"),
]);

export default Plotly as typeof import("./node_modules/@types/plotly.js/lib/core");

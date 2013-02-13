nv.addGraph(function() {
  var chart = nv.models.lineChart();

  chart.xAxis
      .axisLabel('Time (s)')
      .tickFormat(d3.format(',r'));

  chart.yAxis
      .axisLabel('Temperature')
      .tickFormat(d3.format('.02f'));

  d3.select('#tempChart svg')
      .datum(gon.temperatureData)
    .transition().duration(500)
      .call(chart);

  nv.utils.windowResize(chart.update);

  return chart;
});

nv.addGraph(function() {
  var chart = nv.models.lineChart();

  chart.xAxis
      .axisLabel('Time (s)')
      .tickFormat(d3.format(',r'));

  chart.yAxis
      .axisLabel('DO (%)')
      .tickFormat(d3.format('.02f'));

  d3.select('#doChart svg')
      .datum(gon.doData)
    .transition().duration(500)
      .call(chart);

  nv.utils.windowResize(chart.update);

  return chart;
});

nv.addGraph(function() {
  var chart = nv.models.lineChart();

  chart.xAxis
      .axisLabel('Time (s)')
      .tickFormat(d3.format(',r'));

  chart.yAxis
      .axisLabel('Agitation (RPM)')
      .tickFormat(d3.format('.02f'));

  d3.select('#agitChart svg')
      .datum(gon.agitData)
    .transition().duration(500)
      .call(chart);

  nv.utils.windowResize(chart.update);

  return chart;
});

nv.addGraph(function() {
  var chart = nv.models.lineChart();

  chart.xAxis
      .axisLabel('Time (s)')
      .tickFormat(d3.format(',r'));

  chart.yAxis
      .axisLabel('Agitation (RPM)')
      .tickFormat(d3.format('.02f'));

  d3.select('#pHChart svg')
      .datum(gon.pHData)
    .transition().duration(500)
      .call(chart);

  nv.utils.windowResize(chart.update);

  return chart;
});
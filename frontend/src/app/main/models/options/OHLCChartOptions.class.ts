import { AbstractChartOptions } from './AbstractChartOptions.class';
import { OHLCChartConfiguration } from './OHLCChartConfiguration.class';

export class OHLCChartOptions extends AbstractChartOptions {

  getChartType() {
    return 'ohlcBarChart';
  }

  getChartOptions() {
    let conf = this.chartConf instanceof OHLCChartConfiguration ? this.chartConf : new OHLCChartConfiguration();
    conf.x1Axis.tickFormat = conf.xDataType ? this.getTickFormatter(conf.xDataType) : null;
    conf.y1Axis.tickFormat = conf.yDataType ? this.getTickFormatter(conf.yDataType) : null;

    let chart = {
      type: this.getChartType(),
      height: conf.height,
      width: conf.width,
      x: this.getXValue(),
      y: this.getYValue(),
      low: this.getLow(),
      high: this.getHigh(),
      xAxis: conf.x1Axis.getAxisOptions(),
      yAxis: conf.y1Axis.getAxisOptions(),
      showXAxis: conf.showXAxis,
      showYAxis: conf.showYAxis,
      rightAlignYAxis: conf.rightAlignYAxis,
      legend: conf.legend.getLegendOptions(),
      showLegend: conf.showLegend,
      zoom: conf.zoom.getZoomOptions(),
      useInteractiveGuideline: conf.useInteractiveGuideline,
      padData: conf.padData,
      clipEdge: conf.clidEdge,
      noData: conf.noDataMessage
    };
    return chart;
  }

  getLow() {
    return function (d) { return d.low; };
  }

  getHigh() {
    return function (d) { return d.high; };
  }

  getXValue() {
    return function (d) { return d.date; };
  }

  getYValue() {
    return function (d) { return d.close; };
  }
}

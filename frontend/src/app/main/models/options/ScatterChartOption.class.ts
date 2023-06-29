import { AbstractChartOptions } from './AbstractChartOptions.class';
import { ScatterChartConfiguration } from './ScatterChartConfiguration.class';

export class ScatterChartOptions extends AbstractChartOptions {

  protected getChartType(): string {
    return 'scatterChart';
  }

  protected getChartOptions(): Object {
    const conf = this.chartConf instanceof ScatterChartConfiguration ? this.chartConf : new ScatterChartConfiguration();
    conf.x1Axis.tickFormat = conf.xDataType ? this.getTickFormatter(conf.xDataType) : null;
    conf.y1Axis.tickFormat = conf.yDataType ? this.getTickFormatter(conf.yDataType) : null;

    const chart = {
      type: this.getChartType(),
      x: this.getXValue(),
      y: this.getYValue(),
      height: conf.height,
      showDistX: conf.showDistX,
      showDistY: conf.showDistY,
      duration: conf.duration,
      xAxis: conf.x1Axis.getAxisOptions(),
      yAxis: conf.y1Axis.getAxisOptions(),
      legend: conf.legend.getLegendOptions(),
      rightAlignYAxis: conf.rightAlignYAxis,
      showXAxis: conf.showXAxis,
      showYAxis: conf.showYAxis,
      showLegend: conf.showLegend,
      margin: conf.margin.getMarginOptions(),
      clipEdge: conf.clipEdge,
      color: conf.color,
      noData: conf.noDataMessage
    };
    return chart;
  }

}

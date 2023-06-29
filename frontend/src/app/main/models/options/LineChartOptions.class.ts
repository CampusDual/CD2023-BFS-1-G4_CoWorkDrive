import { AbstractChartOptions } from './AbstractChartOptions.class';
import { LineChartConfiguration } from './LineChartConfiguration.class';

export class LineChartOptions extends AbstractChartOptions {

  protected getChartType(): string {
    return 'lineChart';
  }

  protected getChartOptions(): Object {
    let conf = this.chartConf instanceof LineChartConfiguration ? this.chartConf : new LineChartConfiguration;
    conf.x1Axis.tickFormat = conf.xDataType ? this.getTickFormatter(conf.xDataType) : null;
    conf.y1Axis.tickFormat = conf.yDataType ? this.getTickFormatter(conf.yDataType) : null;

    let chart = {
      type: this.getChartType(),
      x: this.getXValue(),
      y: this.getYValue(),
      xAxis: conf.x1Axis.getAxisOptions(),
      x2Axis: conf.x1Axis.getAxisOptions(),
      yAxis: conf.y1Axis.getAxisOptions(),
      y2Axis: conf.y1Axis.getAxisOptions(),
      forceX: conf.forceX,
      forceY: conf.forceY,
      height: this.getChartHeight(),
      width: conf.width,
      margin: conf.margin.getMarginOptions(),
      duration: conf.duration,
      useInteractiveGuideline: conf.useInteractiveGuideline,
      interactive: conf.interactive,
      isArea: this.isArea(),
      legend: conf.legend,
      legendPosition: conf.legendPosition,
      showLegend: conf.showLegend,
      showXAxis: conf.showXAxis,
      showYAxis: conf.showYAxis,
      rightAlignYAxis: conf.rightAlignYAxis,
      focusEnable: conf.focusEnable,
      focusShowAxisX: conf.focusShowAxisX,
      focusShowAxisY: conf.focusShowAxisY,
      noData: conf.noDataMessage
    };
    return chart;
  }

}

import { AbstractChartOptions } from './AbstractChartOptions.class';
import { LinePlusBarFocusChartConfiguration } from './LinePlusBarFocusChartConfiguration.class';

export class LinePlusBarFocusChartOptions extends AbstractChartOptions {

  protected getChartType(): string {
    return 'linePlusBarChart';
  }

  protected getChartOptions(): Object {
    const conf = this.chartConf instanceof LinePlusBarFocusChartConfiguration ? this.chartConf : new LinePlusBarFocusChartConfiguration();
    conf.x1Axis.tickFormat = this.getTickFormatter(conf.xDataType) || conf.xDataType;
    conf.y1Axis.tickFormat = this.getTickFormatter(conf.yDataType) || conf.yDataType;

    const chart = {
      type: this.getChartType(),
      height: conf.height,
      width: conf.width,
      x: this.getXValue(),
      y: this.getYValue(),
      color: conf.color,
      xAxis: conf.x1Axis.getAxisOptions(),
      x2Axis: conf.x1Axis.getAxisOptions(),
      y1Axis: conf.y1Axis.getAxisOptions(),
      y2Axis: conf.y2Axis.getAxisOptions(),
      forceX: conf.forceX,
      forceY: conf.forceY,
      duration: conf.duration,
      margin: conf.margin.getMarginOptions(),
      switchYAxisOrder: conf.switchYAxisOrder,
      showLabels: conf.showLabels,
      showLegend: conf.showLegend,
      legend: conf.legend.getLegendOptions(),
      isArea: conf.isArea,
      interactive: conf.interactive,
      focusEnable: conf.focusEnable,
      focusShowAxisX: conf.focusShowAxisX,
      focusShowAxisY: conf.focusShowAxisY,
      noData: conf.noDataMessage
    };
    return chart;
  }

}

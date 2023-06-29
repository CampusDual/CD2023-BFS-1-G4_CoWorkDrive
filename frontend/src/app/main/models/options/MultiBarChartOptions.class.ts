import { AbstractChartOptions } from './AbstractChartOptions.class';
import { MultiBarChartConfiguration } from './MultiBarChartConfiguration.class';

export class MultiBarChartOptions extends AbstractChartOptions {

  protected getChartType(): string {
    return 'multiBarChart';
  }

  protected getChartOptions(): Object {
    let conf = this.chartConf instanceof MultiBarChartConfiguration ? this.chartConf : new MultiBarChartConfiguration();
    conf.x1Axis.tickFormat = conf.xDataType ? this.getTickFormatter(conf.xDataType) : null;
    conf.y1Axis.tickFormat = conf.yDataType ? this.getTickFormatter(conf.yDataType) : null;

    let chart = {
      type: this.getChartType(),
      x: this.getXValue(),
      y: this.getYValue(),
      height: this.getChartHeight(),
      width: conf.width,
      margin: conf.margin.getMarginOptions(),
      legend: conf.legend.getLegendOptions(),
      xAxis: conf.x1Axis.getAxisOptions(),
      yAxis: conf.y1Axis.getAxisOptions(),
      duration: conf.duration,
      stacked: conf.stacked,
      hideable: conf.hideable,
      groupSpacing: conf.groupSpacing,
      showLegend: conf.showLegend,
      showControls: conf.showControls,
      control: conf.control.getChartControlConfiguration(),
      showXAxis: conf.showXAxis,
      showYAxis: conf.showYAxis,
      reduceXTicks: conf.reduceXTicks,
      rotateLabels: conf.rotateLabels,
      wrapLabels: conf.wrapLabels,
      rightAlignYAxis: conf.rightAlignYAxis,
      noData: conf.noDataMessage
    };
    return chart;
  }

}

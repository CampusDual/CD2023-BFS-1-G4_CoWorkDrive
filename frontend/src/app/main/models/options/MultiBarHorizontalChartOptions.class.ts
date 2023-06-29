import { AbstractChartOptions } from './AbstractChartOptions.class';
import { MultiBarHorizontalChartConfiguration } from './MultiBarHorizontalChartConfiguration.class';

export class MultiBarHorizontalChartOptions extends AbstractChartOptions {

  protected getChartType(): string {
    return 'multiBarHorizontalChart';
  }

  protected getChartOptions(): Object {
    const conf = this.chartConf instanceof MultiBarHorizontalChartConfiguration ? this.chartConf : new MultiBarHorizontalChartConfiguration();
    conf.x1Axis.tickFormat = conf.xDataType ? this.getTickFormatter(conf.xDataType) : null;
    conf.y1Axis.tickFormat = conf.yDataType ? this.getTickFormatter(conf.yDataType) : null;
    const valueFormat = this.getTickFormatter(conf.valueType) || conf.valueType;

    conf.x1Axis.orient = 'left';

    const chart = {
      type: this.getChartType(),
      height: conf.height,
      width: conf.width,
      margin: conf.margin.getMarginOptions(),
      legend: conf.legend.getLegendOptions(),
      x: this.getXValue(),
      y: this.getYValue(),
      xAxis: conf.x1Axis.getAxisOptions(),
      yAxis: conf.y1Axis.getAxisOptions(),
      showControls: conf.showControls,
      showValues: conf.showValues,
      duration: conf.duration,
      stacked: conf.stacked,
      valueFormat: valueFormat,
      valuePadding: conf.valuePadding,
      groupSpacing: conf.groupSpacing,
      showLegend: conf.showLegend,
      showXAxis: conf.showXAxis,
      showYAxis: conf.showYAxis,
      barColor: (conf.color && conf.color.length) ? (_d: any, i: number) => conf.color[i % conf.color.length] : [],
      tooltip: {
        enabled: conf.showTooltip
      },
      callback: conf.callback
    };
    return chart;
  }

  protected getXValue(): Function {
    return d => d.label;
  }

  protected getYValue(): Function {
    return d => d.value;
  }

}

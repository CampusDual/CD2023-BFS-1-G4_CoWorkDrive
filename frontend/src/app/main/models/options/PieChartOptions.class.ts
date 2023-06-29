import { AbstractChartOptions } from './AbstractChartOptions.class';
import { PieChartConfiguration } from './PieChartConfiguration.class';

export class PieChartOptions extends AbstractChartOptions {

  protected getChartType(): string {
    return 'pieChart';
  }

  protected getChartOptions(): Object {
    const conf = this.chartConf instanceof PieChartConfiguration ? this.chartConf : new PieChartConfiguration();
    const valueFormatter = this.getTickFormatter(conf.valueType) || conf.valueType;

    const chart = {
      type: this.getChartType(),
      height: this.getChartHeight(),
      width: conf.width,
      margin: conf.margin.getMarginOptions(),
      duration: conf.duration,
      showLabels: conf.showLabels,
      labelType: conf.labelType,
      labelThreshold: conf.labelThreshold,
      labelSunbeamLayout: conf.labelSunbeamLayout,
      labelsOutside: conf.labelsOutside,
      showLegend: conf.showLeyend,
      legendPosition: conf.legendPosition,
      legend: conf.legend.getLegendOptions(),
      cornerRadius: conf.cornerRadius,
      donut: conf.donut,
      donutRatio: conf.donutRatio,
      color: conf.color,
      valueFormat: valueFormatter,
      tooltip: {
        enabled: conf.showTooltip,
        valueFormatter: valueFormatter
      },
      callback: conf.callback,
      startAngle: conf.startAngle,
      endAngle: conf.endAngle,
      noData: conf.noDataMessage
    };
    return chart;
  }

}

import { AbstractChartOptions } from './AbstractChartOptions.class';
import { RadialPercentChartConfiguration } from './RadialPercentChartConfiguration.class';

export class RadialPercentChartOptions extends AbstractChartOptions {

  protected getChartType(): string {
    return 'pieChart';
  }

  protected getChartOptions(): Object {
    let conf = this.chartConf instanceof RadialPercentChartConfiguration ? this.chartConf : new RadialPercentChartConfiguration();

    let chart = {
      type: this.getChartType(),
      height: this.getChartHeight(),
      width: this.chartConf.width,
      duration: conf.duration,
      donut: conf.donut,
      arcsRadius: conf.arcsRadius,
      showLabels: conf.showLabels,
      showLegend: conf.showLegend,
      titleOffset: conf.titleOffset,
      title: conf.title,
      growOnHover: conf.growOnHover,
      x: this.getXValue(),
      y: this.getYValue(),
      color: conf.color,
      noData: conf.noDataMessage
    }

    return chart;
  }
}
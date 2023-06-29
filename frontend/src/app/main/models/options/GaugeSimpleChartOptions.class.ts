import { AbstractChartOptions } from './AbstractChartOptions.class';
import { GaugeSimpleChartConfiguration } from './GaugeSimpleChartConfiguration.class';

export class GaugeSimpleChartOptions extends AbstractChartOptions {

  protected getChartType(): string {
    return 'gaugeChart';
  }


  protected getChartOptions(): Object {
    let conf = this.chartConf instanceof GaugeSimpleChartConfiguration ? this.chartConf : new GaugeSimpleChartConfiguration();

    let chart = {
      type: this.getChartType(),
      height: this.getChartHeight(),
      width: this.chartConf.width,
      duration: conf.duration,
      color: conf.color,
      title: conf.title,
      showMinMaxLabels: conf.showMinMaxLabels,
      min: conf.min,
      max: conf.max,
      zoneLimit1: conf.zoneLimit1,
      zoneLimit2: conf.zoneLimit2,
      noData: conf.noDataMessage
    }

    return chart;
  }
}
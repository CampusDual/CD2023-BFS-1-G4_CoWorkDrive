import { AbstractChartOptions } from './AbstractChartOptions.class';
import { GaugeSlimChartConfiguration } from './GaugeSlimChartConfiguration.class';

export class GaugeSlimChartOptions extends AbstractChartOptions {
 
  protected getChartType(): string {
    return 'pieChart';
  }

  protected getChartOptions(): Object {
    let conf = this.chartConf instanceof GaugeSlimChartConfiguration ? this.chartConf : new GaugeSlimChartConfiguration();
    const outer = 1;
    const inner = 1 - conf.arcsRadius;
    let arcsRadius = [
      { 'inner': inner, 'outer': outer },
      { 'inner': inner, 'outer': outer }];
    let chart = {
      type: this.getChartType(),
      height: this.getChartHeight(),
      width: this.chartConf.width,
      duration: conf.duration,
      donut: conf.donut,
      arcsRadius: arcsRadius,
      showLabels: conf.showLabels,
      showLegend: conf.showLegend,
      titleOffset: conf.titleOffset,
      title: conf.title,
      growOnHover: conf.growOnHover,
      x: function (d) { return d.x; },
      y: function (d) { return d.y; },
      color: conf.color,
      noData: conf.noDataMessage
    }

    return chart;
  }
}
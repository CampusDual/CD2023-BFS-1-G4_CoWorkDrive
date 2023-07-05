import { AbstractChartOptions } from './AbstractChartOptions.class';
import { GaugeDashboardChartConfiguration } from './GaugeDashboardChartConfiguration.class';

export class GaugeDashboardChartOptions extends AbstractChartOptions {

  protected getChartType(): string {
    return 'pieChart';
  }

  protected getChartOptions(): Object {
    let conf = this.chartConf instanceof GaugeDashboardChartConfiguration ? this.chartConf : new GaugeDashboardChartConfiguration;


    let chart = {
      type: this.getChartType(),
      height: this.getChartHeight(),
      width: this.chartConf.width,
      duration: conf.duration,
      donut: conf.donut,
      donutRatio: conf.donutRatio,
      showLabels: conf.showLabels,
      showLegend: conf.showLegend,
      titleOffset: conf.titleOffset,
      title: conf.title,
      color: conf.color,
      x: function (d) { return d.x; },
      y: function (d) { return d.y; },
      pie: {
        startAngle: function (d) { return d.startAngle / 2 - Math.PI / 2 },
        endAngle: function (d) { return d.endAngle / 2 - Math.PI / 2 }
      },
      noData: conf.noDataMessage
    }

    return chart;
  }
}
import { AbstractChartOptions } from './AbstractChartOptions.class';
import { BulletChartConfiguration } from './BulletChartConfiguration.class';

export class BulletChartOptions extends AbstractChartOptions {

  protected getChartType(): string {
    return 'bulletChart';
  }

  protected getChartOptions(): Object {
    let conf = (this.chartConf instanceof BulletChartConfiguration) ? this.chartConf : new BulletChartConfiguration();
    conf.tickFormat = (conf.xDataType) ? this.getTickFormatter(conf.xDataType) : null;

    let chart = {
      type: this.getChartType(),
      height: this.getChartHeight(),
      width: this.chartConf.width,
      margin: conf.margin.getMarginOptions(),
      duration: conf.duration,
      ticks: conf.ticks,
      tickFormat: conf.tickFormat,
      orient: conf.orient,
      ranges: this.getRanges(),
      measures: this.getMeasure(),
      markers: this.getMarkers(),
      noData: conf.noDataMessage
    }
    return chart;
  }


  getRanges() {
    return function (d) {
      return d.ranges
    };
  }

  getMeasure() {
    return function (d) {
      return d.measures
    }
  }

  getMarkers() {
    return function (d) {
      return d.markers ? d.markers : []
    }
  }
}
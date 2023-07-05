import { AbstractChartOptions } from './AbstractChartOptions.class';
import { RadarChartConfiguration } from './RadarChartConfiguration.class';

declare var d3: any;

export class RadarChartOptions extends AbstractChartOptions {

  getChartOptions() {
    let conf = (this.chartConf instanceof RadarChartConfiguration) ? this.chartConf : new RadarChartConfiguration;
    conf.color = conf.color ? conf.color : d3.scale.category20();
    let chart = {
      type: conf.type,
      height: this.getChartHeight(),
      width: this.chartConf.width,
      duration: 500,
      color: conf.color,
      min: conf.min,
      max: conf.max,
      stepSize: conf.stepSize,
      factor: conf.factor,
      opacityArea: conf.opacityArea,
      legend: conf.legend.getLegendOptions(),
      showLegend: conf.showLegend,
      noData: conf.noDataMessage
    }
    return chart;
  }

  getColor() {

  }
}
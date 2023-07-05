import { AbstractChartOptions } from './AbstractChartOptions.class';
import { BubbleChartConfiguration } from './BubbleChartConfiguration.class';

export class BubbleChartOptions extends AbstractChartOptions {

  getChartType() {
    return 'packedBubbleChart';
  }

  getChartOptions() {
    let conf = (this.chartConf instanceof BubbleChartConfiguration) ? this.chartConf : new BubbleChartConfiguration();

    let chart = {
      type: this.getChartType(),
      height: this.getChartHeight(),
      width: this.chartConf.width,
      duration: 500,
      color: conf.color,
      noData: conf.noDataMessage
    }

    return chart;
  }
}
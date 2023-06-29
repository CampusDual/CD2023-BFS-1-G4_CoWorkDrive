import { ChartConfiguration } from './ChartConfiguration.class';
import { ChartMarginConfiguration } from './ChartMarginConfiguration.class';

export class BulletChartConfiguration extends ChartConfiguration {
  readonly type: string = 'bulletChart';

  ticks: number = null;
  tickFormat: any = null;
  orient: string = 'left';
  duration: number = 500;

  title: string = '';
  subtitle: string = '';

  margin: ChartMarginConfiguration;

  markersAxis: string;
  measuresAxis: string;
  rangesAxis: string;

  constructor() {
    super();
    this.margin = new ChartMarginConfiguration();
  }
}
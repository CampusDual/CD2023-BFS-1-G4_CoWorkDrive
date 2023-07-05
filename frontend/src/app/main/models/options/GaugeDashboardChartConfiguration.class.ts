import { ChartConfiguration } from './ChartConfiguration.class';
import { ChartMarginConfiguration } from './ChartMarginConfiguration.class';

export class GaugeDashboardChartConfiguration extends ChartConfiguration {
  readonly type: string = 'gaugeDashboardChart';
  readonly donut: boolean = true;
  readonly donutRatio: number = 0.5;
  readonly showLabels: boolean = false;
  readonly showLegend: boolean = false;
  duration: number = 500;
  titleOffset: number = -25;
  title: string = '';
  color: Array<string>;

  margin: ChartMarginConfiguration;

  constructor() {
    super();
    this.margin = new ChartMarginConfiguration();
  }

}
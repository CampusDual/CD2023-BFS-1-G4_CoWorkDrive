import { ChartConfiguration } from './ChartConfiguration.class';
import { ChartLegendConfiguration } from './ChartLegendConfiguration.class';

export class RadarChartConfiguration extends ChartConfiguration {
  readonly type: string = 'radarChart';
  color: Array<string>;
  min: number = 0;
  max: number = 1;
  stepSize: number = 0.1;
  factor: number = 1;
  opacityArea: number = 0.5;

  key: string;
  dimensions: Array<string>;

  legend: ChartLegendConfiguration;
  showLegend: boolean = true;

  constructor() {
    super();
    this.legend = new ChartLegendConfiguration();
  }
}
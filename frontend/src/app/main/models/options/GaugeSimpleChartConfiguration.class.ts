import { ChartConfiguration } from './ChartConfiguration.class';

export class GaugeSimpleChartConfiguration extends ChartConfiguration {
  readonly type: string = 'gaugeSimpleChart';

  color: Array<string> = ['#88ac67', '#f78f20', '#db4e4e'];
  title: string = '';
  showMinMaxLabels: boolean = false;
  min: number = 0;
  max: number = 100;
  zoneLimit1: number = 0.6;
  zoneLimit2: number = 0.8;
  duration: number = 500;
}
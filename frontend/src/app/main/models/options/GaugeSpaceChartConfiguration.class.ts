import { ChartConfiguration } from './ChartConfiguration.class';

export class GaugeSpaceChartConfiguration extends ChartConfiguration {
  readonly type: string = 'gaugeSpaceChart';
  readonly donut: boolean = true;
  arcsRadius: number = 0.1;
  readonly showLabels: boolean = false;
  showLegend: boolean = false;
  legendPosition: string = 'top';
  title: string = '';
  titleOffset: number = 0;
  color: string = 'blue';
  duration: number = 500;
  growOnHover: boolean = false;
}
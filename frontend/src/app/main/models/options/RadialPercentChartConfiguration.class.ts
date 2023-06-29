import { ChartConfiguration } from './ChartConfiguration.class';

export class RadialPercentChartConfiguration extends ChartConfiguration {
  readonly type: string = 'radialPercentChart';
  readonly donut: boolean = true;
  readonly arcsRadius: Array<Object> = [
    { inner: 0.7, outer: 1 },
    { inner: 0.8, outer: 0.9}
  ];
  readonly showLabels: boolean = false;
  showLegend: boolean = false;
  legendPosition: string = 'top';
  title: string = '';
  titleOffset: number = 0;
  color: Array<string> = ['green', 'grey'];
  duration: number = 500;
  growOnHover: boolean = false;
}
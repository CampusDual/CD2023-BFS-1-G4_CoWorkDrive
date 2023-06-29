import { ChartConfiguration } from './ChartConfiguration.class';

export class ParallelCoordinatesChartConfiguration extends ChartConfiguration {
  readonly type: string = 'parallelCoordinatesChart';
  dimensionData: Array<Object>;
  undefinedValueLabel: string = 'Undefined Value';
  lineTension: number = 1;
  color: Array<string>;
}
import { ChartConfiguration } from './ChartConfiguration.class';

export class BubbleChartConfiguration extends ChartConfiguration {
  readonly type: string = 'bubbleChart';
  color: Array<string>;
}
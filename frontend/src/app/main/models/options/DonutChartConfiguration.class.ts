import { PieChartConfiguration } from './PieChartConfiguration.class';

export class DonutChartConfiguration extends PieChartConfiguration {

  public readonly type: string = 'donutChart';
  public readonly donut: boolean = true;

  public donutRatio: number = 0.35;

  constructor() {
    super();
  }

}

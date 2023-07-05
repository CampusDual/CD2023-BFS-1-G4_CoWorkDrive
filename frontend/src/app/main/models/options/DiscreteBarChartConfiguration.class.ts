import { ChartConfiguration } from './ChartConfiguration.class';
import { ChartLegendConfiguration } from './ChartLegendConfiguration.class';
import { ChartAxisConfiguration } from './ChartAxisConfiguration.class';
import { ChartMarginConfiguration } from './ChartMarginConfiguration.class';

export class DiscreteBarChartConfiguration extends ChartConfiguration {
  readonly type: string = 'discreteBar';

  showValues: boolean = true;
  duration: number = 500;

  showLegend: boolean = false;
  legend: ChartLegendConfiguration;

  staggerLabels: boolean = false;
  rotateLabels: number = 0;
  wrapLabels: boolean = true;

  showXAxis: boolean = true;
  showYAxis: boolean = true;
  rightAlingYAxis: boolean = false;
  x1Axis: ChartAxisConfiguration;
  y1Axis: ChartAxisConfiguration;

  margin: ChartMarginConfiguration;

  agroup: boolean = false;
  public color: string[] = null;

  constructor() {
    super();
    this.legend = new ChartLegendConfiguration();
    this.x1Axis = new ChartAxisConfiguration();
    this.y1Axis = new ChartAxisConfiguration();
    this.margin = new ChartMarginConfiguration();
  }
}

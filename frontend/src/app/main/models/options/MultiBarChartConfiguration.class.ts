import { ChartAxisConfiguration } from './ChartAxisConfiguration.class';
import { ChartConfiguration } from './ChartConfiguration.class';
import { ChartControlConfiguration } from './ChartControlConfiguration.class';
import { ChartLegendConfiguration } from './ChartLegendConfiguration.class';
import { ChartMarginConfiguration } from './ChartMarginConfiguration.class';

export class MultiBarChartConfiguration extends ChartConfiguration {

  public readonly type: string = 'multiBar';

  public margin: ChartMarginConfiguration;

  public showLegend: boolean = true;
  public legend: ChartLegendConfiguration;

  public duration: number = 500;
  public stacked: boolean = true;
  public hideable: boolean = false;
  public groupSpacing: number = 0.1;
  public reduceXTicks: boolean = true;

  public showControls: boolean = true;
  public control: ChartControlConfiguration;

  public rotateLabels: number = 0;
  public wrapLabels: boolean = false;

  public showXAxis: boolean = true;
  public showYAxis: boolean = true;
  public rightAlignYAxis: boolean = false;
  public x1Axis: ChartAxisConfiguration;
  public y1Axis: ChartAxisConfiguration;

  public color: string[] = null;

  constructor() {
    super();
    this.margin = new ChartMarginConfiguration();
    this.legend = new ChartLegendConfiguration();
    this.x1Axis = new ChartAxisConfiguration();
    this.y1Axis = new ChartAxisConfiguration();
    this.control = new ChartControlConfiguration();
  }

}

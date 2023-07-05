import { ChartAxisConfiguration } from './ChartAxisConfiguration.class';
import { ChartConfiguration } from './ChartConfiguration.class';
import { ChartLegendConfiguration } from './ChartLegendConfiguration.class';
import { ChartMarginConfiguration } from './ChartMarginConfiguration.class';

export class MultiBarHorizontalChartConfiguration extends ChartConfiguration {

  public readonly type: string = 'multiBarHorizontalChart';

  public showLegend: boolean = true;
  public legend: ChartLegendConfiguration;
  /** Allow user to switch between "Grouped" and "Stacked" mode */
  public showControls: boolean = true;
  /** Show bar value next to each bar */
  public showValues: boolean = true;
  public margin: ChartMarginConfiguration;
  public valuePadding: number = 60;
  public groupSpacing: number = 0.1;
  public duration: number = 500;
  public stacked: boolean = false;
  public showXAxis: boolean = true;
  public showYAxis: boolean = false;
  public x1Axis: ChartAxisConfiguration;
  public y1Axis: ChartAxisConfiguration;
  public color: string[] = null;
  /** Formats value(s) */
  public valueType: string;
  /** Enables or disabled the tooltip */
  public showTooltip: boolean = true;

  constructor() {
    super();
    this.legend = new ChartLegendConfiguration();
    this.margin = new ChartMarginConfiguration();
    this.x1Axis = new ChartAxisConfiguration();
    this.y1Axis = new ChartAxisConfiguration();
  }

}

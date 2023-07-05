import { ChartAxisConfiguration } from './ChartAxisConfiguration.class';
import { ChartConfiguration } from './ChartConfiguration.class';
import { ChartLegendConfiguration } from './ChartLegendConfiguration.class';
import { ChartMarginConfiguration } from './ChartMarginConfiguration.class';

export class LinePlusBarFocusChartConfiguration extends ChartConfiguration {

  public readonly type: string = 'linePlusBarWithFocusChart';

  public x1Axis: ChartAxisConfiguration;
  public y1Axis: ChartAxisConfiguration;
  public y2Axis: ChartAxisConfiguration;
  public switchYAxisOrder: boolean = false;

  public showLabels: boolean = false;
  public showLegend: boolean = true;
  public legend: ChartLegendConfiguration;

  public duration: number = 350;
  public margin: ChartMarginConfiguration;
  public isArea: any;
  public interactive: boolean = true;

  public focusEnable: boolean = true;
  public focusShowAxisX: boolean = true;
  public focusShowAxisY: boolean = false;

  public forceX: number[];
  public forceY: number[];

  // Parameter for select chart with bars or line
  public bars: boolean[];
  // Parameters for select the chart colors
  public color: string[];

  // Parameters for create equispaced points in chart to_zero is priority in the case of two parameters are activated
  public to_zero: boolean[];
  public to_previusValue: boolean[];

  constructor() {
    super();
    this.x1Axis = new ChartAxisConfiguration();
    this.y1Axis = new ChartAxisConfiguration();
    this.y2Axis = new ChartAxisConfiguration();
    this.legend = new ChartLegendConfiguration();
    this.isArea = this.functionIsArea();
    this.margin = new ChartMarginConfiguration();
  }

  protected functionIsArea(): Function {
    return d => d.area;
  }

}

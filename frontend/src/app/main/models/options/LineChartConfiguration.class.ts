import { ChartAxisConfiguration } from './ChartAxisConfiguration.class';
import { ChartConfiguration } from './ChartConfiguration.class';
import { ChartLegendConfiguration } from './ChartLegendConfiguration.class';
import { ChartMarginConfiguration } from './ChartMarginConfiguration.class';

export class LineChartConfiguration extends ChartConfiguration {

  public readonly type: string = 'line';

  public legend: ChartLegendConfiguration;
  public legendPosition: string = 'top';
  public showLegend: boolean = true;

  public duration: number = 500;
  public useInteractiveGuideline: boolean = true;
  public interactive: boolean = true;
  public margin: ChartMarginConfiguration;

  public isArea: boolean[] = null;
  public strokeWidth: number[] = null;
  public classed: string[] = null;
  public color: string[] = null;

  public showXAxis: boolean = true;
  public showYAxis: boolean = true;
  public x1Axis: ChartAxisConfiguration;
  public y1Axis: ChartAxisConfiguration;
  public rightAlignYAxis: boolean = false;

  public forceX: number[] = null;
  public forceY: number[] = null;

  public focusEnable: boolean = false;
  public focusShowAxisX: boolean = false;
  public focusShowAxisY: boolean = false;

  constructor() {
    super();
    this.legend = new ChartLegendConfiguration();
    this.x1Axis = new ChartAxisConfiguration();
    this.y1Axis = new ChartAxisConfiguration();
    this.margin = new ChartMarginConfiguration();
  }

}

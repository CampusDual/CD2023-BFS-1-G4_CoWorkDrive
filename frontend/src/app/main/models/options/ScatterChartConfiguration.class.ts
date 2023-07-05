import { ChartAxisConfiguration } from './ChartAxisConfiguration.class';
import { ChartConfiguration } from './ChartConfiguration.class';
import { ChartLegendConfiguration } from './ChartLegendConfiguration.class';
import { ChartMarginConfiguration } from './ChartMarginConfiguration.class';

export class ScatterChartConfiguration extends ChartConfiguration {

  public readonly type: string = 'scatterChart';

  public showDistX: boolean = true;
  public showDistY: boolean = true;
  public showXAxis: boolean = true;
  public showYAxis: boolean = true;

  public showLegend: boolean = true;
  public legend: ChartLegendConfiguration;

  public duration: number = 350;
  public margin: ChartMarginConfiguration;
  public clipEdge: boolean = false;

  public rightAlignYAxis: boolean = false;
  public x1Axis: ChartAxisConfiguration;
  public y1Axis: ChartAxisConfiguration;

  public color: string[] = null;
  public shape: string[] = null;
  public size: number[] = null;

  constructor() {
    super();
    this.x1Axis = new ChartAxisConfiguration();
    this.y1Axis = new ChartAxisConfiguration();
    this.margin = new ChartMarginConfiguration();
    this.legend = new ChartLegendConfiguration();
  }

}

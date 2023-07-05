import { ChartConfiguration } from './ChartConfiguration.class';
import { ChartAxisConfiguration } from './ChartAxisConfiguration.class';
import { ChartLegendConfiguration } from './ChartLegendConfiguration.class';
import { ChartZoomConfiguration } from './ChartZoomConfiguration.class';

export class OHLCChartConfiguration extends ChartConfiguration {
  readonly type: string = 'ohlcBarChart';

  x1Axis: ChartAxisConfiguration;
  showXAxis: boolean = true;
  y1Axis: ChartAxisConfiguration;
  showYAxis: boolean = true;
  rightAlignYAxis: boolean = false;

  legend: ChartLegendConfiguration;
  showLegend: boolean = false;

  zoom: ChartZoomConfiguration;

  low: any;
  high: any;

  useInteractiveGuideline: boolean = true;
  padData: boolean = false;
  clidEdge: boolean = true;

  //Properties for select the values of date, open,
  // close, high and low in data adapter
  xColumn: string;
  openAxis: string;
  closeAxis: string;
  highAxis: string;
  lowAxis: string;

  constructor() {
    super();
    this.x1Axis = new ChartAxisConfiguration();
    this.y1Axis = new ChartAxisConfiguration();
    this.legend = new ChartLegendConfiguration();
    this.zoom = new ChartZoomConfiguration();
  }
}

import { ChartConfiguration } from './ChartConfiguration.class';
import { ChartAxisConfiguration } from './ChartAxisConfiguration.class';
import { ChartZoomConfiguration } from './ChartZoomConfiguration.class';
import { ChartLegendConfiguration } from './ChartLegendConfiguration.class';
import { ChartControlConfiguration } from './ChartControlConfiguration.class';

export class StackedAreaChartConfiguration extends ChartConfiguration {
  readonly type: string = 'stackedAreaChart';

  x1Axis: ChartAxisConfiguration;
  showXAxis: boolean = true;
  y1Axis: ChartAxisConfiguration;
  showYAxis: boolean = true;
  rightAlignYAxis: boolean = false;

  legend: ChartLegendConfiguration;
  showLegend: boolean = true;

  control: ChartControlConfiguration;
  showControls: boolean = true;

  zoom: ChartZoomConfiguration;

  useInteractiveGuideline: boolean = true;
  style: string = 'stack';
  interactive: boolean = true;
  useVoronoi: boolean = true;
  showVoronoi: boolean = false;

  color: Array<string>;

  constructor() {
    super();
    this.x1Axis = new ChartAxisConfiguration();
    this.y1Axis = new ChartAxisConfiguration();
    this.legend = new ChartLegendConfiguration();
    this.control = new ChartControlConfiguration();
    this.zoom = new ChartZoomConfiguration();
  }
}
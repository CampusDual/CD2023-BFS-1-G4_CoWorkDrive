import { AbstractChartOptions } from './AbstractChartOptions.class';
import { StackedAreaChartConfiguration } from './StackedAreaChartConfiguration.class';

export class StackedAreaChartOptions extends AbstractChartOptions {

  protected getChartType() {
    return 'stackedAreaChart';
  }

  protected getChartOptions() {
    let conf = this.chartConf instanceof StackedAreaChartConfiguration ? this.chartConf : new StackedAreaChartConfiguration();
    conf.x1Axis.tickFormat = conf.xDataType ? this.getTickFormatter(conf.xDataType) : null;
    conf.y1Axis.tickFormat = conf.yDataType ? this.getTickFormatter(conf.yDataType) : null;

    let chart = {
      type: this.getChartType(),
      duration: 500,
      height: this.getChartHeight(),
      width: this.chartConf.width,
      x: this.getXValue(),
      y: this.getYValue(),
      xAxis: conf.x1Axis.getAxisOptions(),
      showXAxis: conf.showXAxis,
      yAxis: conf.y1Axis.getAxisOptions(),
      showYAxis: conf.showYAxis,
      rightAlignYAxis: conf.rightAlignYAxis,
      legend: conf.legend.getLegendOptions(),
      showLegend: conf.showLegend,
      control: conf.control.getChartControlConfiguration(),
      showControls: conf.showControls,
      zoom: conf.zoom.getZoomOptions(),
      useInteractiveGuideline: conf.useInteractiveGuideline,
      style: conf.style,
      interactive: conf.interactive,
      useVoronoi: conf.useVoronoi,
      showVoronoi: conf.showVoronoi,
      noData: conf.noDataMessage
    };

    return chart;
  }
}
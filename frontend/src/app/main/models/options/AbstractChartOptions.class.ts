import { OTranslateService } from 'ontimize-web-ngx';
import { ChartConfiguration } from './ChartConfiguration.class';
import { D3LocaleOptions } from './D3LocaleOptions';

declare var d3: any;

export class AbstractChartOptions {

  protected chartConf: ChartConfiguration;
  protected type: string;
  protected d3Locale: D3LocaleOptions;

  constructor(chartConf: ChartConfiguration, protected translate: OTranslateService) {
    this.chartConf = chartConf;
    this.d3Locale = new D3LocaleOptions(this.translate);
    this.init(chartConf);
  }

  public init(chartConf: ChartConfiguration): void {
    if (!chartConf) {
      console.error('Chart configuration not found!');
      return;
    }
    this.type = chartConf.type;
  }

  public getOptions(): Object {
    return {
      chart: this.getChartOptions(),
    };
  }

  protected getChartOptions(): Object {
    return {
      type: this.getChartType(),
      height: this.getChartHeight(),
      x: this.getXValue(),
      y: this.getYValue(),
      xAxis: this.getXAxisConfiguration(),
      yAxis: this.getYAxisConfiguration(),
      noData : this.chartConf.noDataMessage
    };
  }

  protected getChartType(): string {
    return this.type + 'Chart';
  }

  protected getChartHeight(): number {
    return this.chartConf.height ? this.chartConf.height : 450;
  }

  protected getXValue(): Function {
    return d => d.x;
  }

  protected getYValue(): Function {
    return d => d.y;
  }

  protected isArea(): Function {
    return d => d.area;
  }

  protected getXAxisConfiguration(): Object {
    return {
      axisLabel: this.chartConf.xLabel ? this.chartConf.xLabel : ''
    };
  }

  protected getYAxisConfiguration(): Object {
    return {
      axisLabel: this.chartConf.yLabel ? this.chartConf.yLabel : ''
    };
  }

  protected getTickFormatter(type: string): any {
    let localeFormat = d3 && this.d3Locale ? d3.locale(this.d3Locale.getD3Options()) : undefined;

    switch (type) {
      case 'intGrouped':
        return localeFormat ? d => localeFormat.numberFormat(',d')(d)
          : d => d3.format(',d')(d);
      case 'floatGrouped':
        return localeFormat ? d => localeFormat.numberFormat(',.02f')(d)
          : d => d3.format(',.02f')(d);
      case 'int':
        return localeFormat ? d => localeFormat.numberFormat('d')(d)
          : d => d3.format('d')(d);
      case 'float':
        return localeFormat ? d => localeFormat.numberFormat('.02f')(d)
          : d => d3.format('.02f')(d);
      case 'currency':
        return localeFormat ? d => localeFormat.numberFormat('$,.02f')(d)
          : d => d3.format('$,.02f')(d);
      case 'time':
        return localeFormat ? d => localeFormat.timeFormat('%x')(new Date(d))
          : d => d3.time.format('%x')(new Date(d));
      case 'timeDay':
        return d => d3.time.format('%H:%M:%S')(new Date(d));
      case 'timeDetail':
        return localeFormat ? d => localeFormat.timeFormat('%x %H:%M:%S')(new Date(d))
          : d => d3.time.format('%x %H:%M:%S')(new Date(d));
      case 'percentage':
        return d => d3.format('.0%')(d);
      default:
        if (typeof type === 'function') {
          return type;
        }
        return void 0;
    }
  }

}

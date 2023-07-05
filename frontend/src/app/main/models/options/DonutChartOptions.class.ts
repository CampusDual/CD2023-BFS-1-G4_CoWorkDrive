import { OTranslateService } from 'ontimize-web-ngx';

import { ChartConfiguration } from './ChartConfiguration.class';
import { PieChartOptions } from './PieChartOptions.class';

export class DonutChartOptions extends PieChartOptions {

  constructor(chartConf: ChartConfiguration, protected translate: OTranslateService) {
    super(chartConf, translate);
  }

}

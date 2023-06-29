import { ChartMarginConfiguration } from './ChartMarginConfiguration.class';

export class ChartLegendConfiguration {

  public width: string = 'auto';
  public height: string = 'auto';
  public align: boolean = true;
  public rightAlign: boolean = true;
  public maxKeyLength: number = 20;
  public padding: number = 40;
  public updateState: boolean = true;
  public radioButtonMode: boolean = false;
  public expanded: boolean = false;
  public vers: string = 'classic';
  public margin: ChartMarginConfiguration;

  constructor() {
    this.margin = new ChartMarginConfiguration();
    this.margin.top = 0;
    this.margin.right = 0;
    this.margin.bottom = 0;
    this.margin.left = 0;
  }

  public getLegendOptions(): any {
    const legend = {
      width: this.width,
      height: this.height,
      align: this.align,
      rightAlign: this.rightAlign,
      maxKeyLength: this.maxKeyLength,
      padding: this.padding,
      updateState: this.updateState,
      radioButtonMode: this.radioButtonMode,
      expanded: this.expanded,
      vers: this.vers,
      margin: this.margin
    };
    return legend;
  }

}

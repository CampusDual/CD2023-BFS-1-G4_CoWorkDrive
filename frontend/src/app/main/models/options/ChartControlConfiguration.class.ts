export class ChartControlConfiguration {
  align: boolean = true;
  rightAlign: boolean = false;

  maxKeyLenght: number = 20;

  radioButtonMode: boolean = false;
  expanded: boolean = false;

  padding: number = 32;

  getChartControlConfiguration() {
    return {
      align: this.align,
      rightAlign: this.rightAlign,
      maxKeyLenght: this.maxKeyLenght,
      radioButtonMode: this.radioButtonMode,
      expanded: this.expanded,
      padding: this.padding
    }
  }
}
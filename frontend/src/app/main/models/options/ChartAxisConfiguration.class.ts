export class ChartAxisConfiguration {

  public axisLabel: string = '';
  public axisLabelDistance: number = 0;
  public staggerLabels: boolean = false;
  public rotateLabels: number = 0;
  public rotateYLabel: boolean = true;
  public showMaxMin: boolean = true;

  public duration: number = 250;
  public orient: string = 'bottom';
  public fontSize: number = 12;

  public tickFormat: any = null;
  public tickValues: number[] = null;
  public ticks: number = null;
  public tickPadding: number;

  public getAxisOptions(): Object {
    const axis = {
      axisLabel: this.axisLabel,
      axisLabelDistance: this.axisLabelDistance,
      staggerLabels: this.staggerLabels,
      rotateLabels: this.rotateLabels,
      rotateYLabel: this.rotateYLabel,
      showMaxMin: this.showMaxMin,
      duration: this.duration,
      orient: this.orient,
      fontSize: this.fontSize,
      tickFormat: this.tickFormat,
      ticks: this.ticks,
      ticksValues: this.tickValues,
      tickPadding: this.tickPadding
    };
    return axis;
  }

}

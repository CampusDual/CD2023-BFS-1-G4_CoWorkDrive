export class ChartMarginConfiguration {

  public top: number = 30;
  public bottom: number = 40;
  public right: number = 40;
  public left: number = 60;

  public getMarginOptions(): Object {
    const opt = {
      top: this.top,
      bottom: this.bottom,
      right: this.right,
      left: this.left
    };
    return opt;
  }

}

export class ChartZoomConfiguration {
  enabled: boolean = true;
  scaleExtend: [number, number] = [1, 10];
  useFixedDomain: boolean = false;
  useNiceScale: boolean = false;
  horizontalOff: boolean = false;
  verticalOff: boolean = false;
  unzoomEventType: string = 'dblclick.zoom';


  public getZoomOptions() {
    let zoom = {
      enabled: this.enabled,
      scaleExtend: this.scaleExtend,
      useFixedDomain: this.useFixedDomain,
      useNiceScale: this.useNiceScale,
      horizontalOff: this.horizontalOff,
      verticalOff: this.verticalOff,
      unzoomEventType: this.unzoomEventType
    };
    return zoom;
  }
}

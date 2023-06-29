export class ChartTitleConfiguration {
  enable: boolean = true;
  text: string = 'Ejemplo de título';
  className: string = 'h4';
  css_textAlign: string = 'center';

  getTitleConfiguration() {
    let conf = {
      enable: this.enable,
      text: this.text,
      className: this.className
    }
    return conf;
  }
}

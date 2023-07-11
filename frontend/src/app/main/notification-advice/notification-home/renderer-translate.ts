import { Component, Injector, TemplateRef, ViewChild } from "@angular/core";
import { OBaseTableCellRenderer, OTranslateService } from "ontimize-web-ngx";

@Component({
    selector: 'o-table-translate-message',
    templateUrl: 'renderer-translate.component.html'
})
export class OTableTranslateMessage extends OBaseTableCellRenderer {

    @ViewChild('templateref', { read: TemplateRef, static: false }) public templateref: TemplateRef<any>;
  
    constructor(protected injector: Injector, protected translate: OTranslateService) {
      super(injector);
    }
  
    getCellData(cellvalue: any, rowvalue: Object) {
      return rowvalue['driver'] + " " + this.translate.get(rowvalue['text_notification']) + " " + this.translate.get('your trip for day') + " " + this.convertDate(rowvalue['date']) + 
      " " + this.translate.get('from') + " " + rowvalue['origin_title'] + " " + this.translate.get('to') + " " + rowvalue['destination_title'] ;
    }
     
    // Function to convert a date into a readable date format
    convertDate(date: Date){
    const newDate = new Date(date);
    return (newDate.toLocaleDateString());
    }
  
}
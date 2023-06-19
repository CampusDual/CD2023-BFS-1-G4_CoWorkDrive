import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { DialogService, OFormComponent, OntimizeService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-trip-new',
  templateUrl: './trip-new.component.html',
  styleUrls: ['./trip-new.component.css']
})
export class TripNewComponent implements OnInit {
  @ViewChild('formTrip', { static: false }) formTrip: OFormComponent;
  private tripService: OntimizeService;

  constructor(public injector: Injector,    
    protected dialogService: DialogService,) { 
    }

  ngOnInit() {
  }
  
  clearTrip(): void{
    this.formTrip.clearData();
  }

  insertTrip(): void{
    this.dialogService.confirm('Trip register', 'Do you really want to confirm?');
    this.dialogService.dialogRef.afterClosed().subscribe( result => {
      if(result) {
        this.formTrip.setFieldValue("id_trip", this.formTrip.getFieldValue("id_trip"));
        this.formTrip.setFieldValue("origin",this.formTrip.getFieldValue("origin"));
        this.formTrip.setFieldValue("destination",this.formTrip.getFieldValue("destination"));
        this.formTrip.setFieldValue("date",this.formTrip.getFieldValue("date"));
        this.formTrip.setFieldValue("time",this.formTrip.getFieldValue("time"));
        this.formTrip.insert();
      }
    });
  }

  configureService(){
    const conf = this.tripService.getDefaultServiceConfiguration('trips');
    this.tripService.configureService(conf);
  }

  protected dateValue: Date = new Date('10/05/2018');

    public getValue(type: string = 'timestamp'): any {
      let result: any;
      switch (type) {
        case 'string':
          result = '10/05/2018';
          break;
        case 'date':
          result = this.dateValue;
          break;
        case 'ISO-8601':
          result = this.dateValue.toISOString();
          break;
        case 'timestamp':
          result = this.dateValue.getTime();
          break;
        default:
          break;
      }
      return result;
    }
}

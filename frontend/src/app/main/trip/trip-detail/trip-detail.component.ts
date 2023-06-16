import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { DialogService, OFormComponent, OntimizeService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-trip-detail',
  templateUrl: './trip-detail.component.html',
  styleUrls: ['./trip-detail.component.css']
})
export class TripDetailComponent implements OnInit {
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

  updateTrip(): void{
    this.dialogService.confirm('Trip update', 'Do you really want to confirm?');
    this.dialogService.dialogRef.afterClosed().subscribe( result => {
      if(result) {
        this.formTrip.setFieldValue("id_trip", this.formTrip.getFieldValue("id_trip"));
        this.formTrip.setFieldValue("origin",this.formTrip.getFieldValue("origin"));
        this.formTrip.setFieldValue("destination",this.formTrip.getFieldValue("destination"));
        this.formTrip.setFieldValue("date",this.formTrip.getFieldValue("date"));
        this.formTrip.setFieldValue("time",this.formTrip.getFieldValue("time"));
        this.formTrip.update();
      }
    });
  }

  configureService(){
    const conf = this.tripService.getDefaultServiceConfiguration('trips');
    this.tripService.configureService(conf);
  }
}

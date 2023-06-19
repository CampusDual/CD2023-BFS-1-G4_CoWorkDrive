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
    protected dialogService: DialogService) { 
  }

  ngOnInit() {
  }
  
  clearTrip(): void {
    // Clear the trip form data
    this.formTrip.clearData();
  }

  insertTrip(): void {
    // Show a confirmation dialog when attempting to insert a trip
    this.dialogService.confirm('Trip register', 'Do you really want to confirm?');
    this.dialogService.dialogRef.afterClosed().subscribe(result => {
      if (result) {
        // If the registration is confirmed, set the form values and perform the insertion
        this.formTrip.setFieldValue("id_trip", this.formTrip.getFieldValue("id_trip"));
        this.formTrip.setFieldValue("origin", this.formTrip.getFieldValue("origin"));
        this.formTrip.setFieldValue("destination", this.formTrip.getFieldValue("destination"));
        this.formTrip.setFieldValue("date", this.formTrip.getFieldValue("date"));
        this.formTrip.setFieldValue("time", this.formTrip.getFieldValue("time"));
        this.formTrip.insert();
      }
    });
  }

  configureService() {
    // Get the default configuration of the 'trips' service and configure the 'tripService' accordingly
    const conf = this.tripService.getDefaultServiceConfiguration('trips');
    this.tripService.configureService(conf);
  }
}

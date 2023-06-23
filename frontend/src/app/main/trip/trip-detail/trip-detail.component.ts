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
    protected dialogService: DialogService,
    ) {
  }
  
  ngOnInit() {
  }

  clearTrip(): void {
    // Clear the data of the trip form
    this.formTrip.clearData();
  }

  updateTrip(): void {
    // Display a confirmation dialog when attempting to update a trip
    this.dialogService.confirm('Trip update', 'Do you really want to confirm?');
    this.dialogService.dialogRef.afterClosed().subscribe(result => {
      if (result) {
        // If the update is confirmed, set the form field values and perform the update
        this.formTrip.setFieldValue("id_trip", this.formTrip.getFieldValue("id_trip"));
        this.formTrip.setFieldValue("origin_title", this.formTrip.getFieldValue("origin_title"));
        this.formTrip.setFieldValue("origin_address", this.formTrip.getFieldValue("origin_address"));
        this.formTrip.setFieldValue("destination_title", this.formTrip.getFieldValue("destination_title"));
        this.formTrip.setFieldValue("destination_address", this.formTrip.getFieldValue("destination_address"));
        this.formTrip.setFieldValue("date", this.formTrip.getFieldValue("date"));
        this.formTrip.setFieldValue("time", this.formTrip.getFieldValue("time"));
        this.formTrip.setFieldValue("id_car", this.formTrip.getFieldValue("id_car"));
        this.formTrip.update();
      }
    });
  }

  configureService() {
    // Get the default configuration of the 'trips' service and configure the 'tripService' accordingly
    const conf = this.tripService.getDefaultServiceConfiguration('trips');
    this.tripService.configureService(conf);
  }
}

import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { MatDialogRef } from '@angular/material';
import { ActivatedRoute, Router } from '@angular/router';
import { DialogService, OFormComponent, OntimizeService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-trip-detail',
  templateUrl: './trip-detail.component.html',
  styleUrls: ['./trip-detail.component.css']
})
export class TripDetailComponent implements OnInit {
  @ViewChild('formTrip', { static: false }) formTrip: OFormComponent;
  private tripService: OntimizeService;
  idTrip: number;

  private bookingService: OntimizeService;
  public bookingsNumber: Number;

  constructor(public injector: Injector,
    protected dialogService: DialogService,
    public router: Router,
    public dialogRef: MatDialogRef<TripDetailComponent>
    ) {
    this.tripService = this.injector.get(OntimizeService);
    this.bookingService = this.injector.get(OntimizeService);
  }
  
  ngOnInit() {

  }

  ngAfterContentInit(){
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
        this.formTrip.update();
      }
    });
  }

  hasBookings(){
    const conf = this.bookingService.getDefaultServiceConfiguration('trips');
    this.bookingService.configureService(conf);
    // Get the number of available cars and show an alert if there are none
    this.bookingService.query({id_trip: this.formTrip.getFieldValue("id_trip")}, ['number_bookings'], 'numberTripsOnBooking').subscribe(
      res => {
        this.getNumberBookings(res.data[0].number_bookings);
      }
    );
  }

  getNumberBookings(bookingsNumber: Number){
    this.bookingsNumber = bookingsNumber;
    if(this.bookingsNumber !=0){
      alert("You cannot change anything or delete");
    }
  }

  deleteTrip(): void{
      // Show a confirmation dialog
      this.dialogService.confirm('Trip delete', 'Do you really want to confirm?');
      // Subscribe to dialog close
      this.dialogService.dialogRef.afterClosed().subscribe( result => {
        if(result) {
          // Perform the form update
          this.tripService.delete({id_trip: this.formTrip.getFieldValue("id_trip")}, 'trip').subscribe(
            res=>{
              this.dialogRef.close();
            });
        }
      });
  }

  configureService() {
    // Get the default configuration of the 'trips' service and configure the 'tripService' accordingly
    const conf = this.tripService.getDefaultServiceConfiguration('trips');
    this.tripService.configureService(conf);
  }
}

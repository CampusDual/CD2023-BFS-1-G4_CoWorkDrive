import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { MatDialogRef } from '@angular/material';
import { ActivatedRoute, Router } from '@angular/router';
import { DialogService, OFormComponent, OntimizeService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-trip-detail-done',
  templateUrl: './trip-detail-done.component.html',
  styleUrls: ['./trip-detail-done.component.css']
})
export class TripDetailDoneComponent implements OnInit {
    @ViewChild('formTrip', { static: false }) formTrip: OFormComponent;
    
    private tripService: OntimizeService;
    idTrip: number;
  
    public minDate: string;
    public maxDate: string;
  
    private bookingService: OntimizeService;
    public bookingsNumber: Number;
  
    constructor(
      private actRoute: ActivatedRoute,
      public router: Router,
      public injector: Injector,
      protected dialogService: DialogService,
      public dialogRef: MatDialogRef<TripDetailDoneComponent>
      ) {
      this.tripService = this.injector.get(OntimizeService);
      this.bookingService = this.injector.get(OntimizeService);
      this.router = router;
    }
    
    ngOnInit() {
  
    }

    // Check if a trip has bookings
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
    }

    // Reuse the trip by storing its details in local storage and navigating to the new trip page
    reuseTrip(){
      localStorage.setItem("origin_title",this.formTrip.getFieldValue("origin_title"));
      localStorage.setItem("origin_address",this.formTrip.getFieldValue("origin_address"));
      localStorage.setItem("destination_title",this.formTrip.getFieldValue("destination_title"));
      localStorage.setItem("destination_address",this.formTrip.getFieldValue("destination_address"));
      localStorage.setItem("time",this.formTrip.getFieldValue("time"));
      localStorage.setItem("id_car",this.formTrip.getFieldValue("id_car"));
      this.dialogRef.close();
      this.router.navigate(['/main/trip/new'], { relativeTo: this.actRoute });
    }
  
    configureService() {
      // Get the default configuration of the 'trips' service and configure the 'tripService' accordingly
      const conf = this.tripService.getDefaultServiceConfiguration('trips');
      this.tripService.configureService(conf);
    }
  }
  
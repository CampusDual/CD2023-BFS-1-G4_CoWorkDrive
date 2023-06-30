import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { DialogService, OFormComponent, OntimizeService, SnackBarService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-trip-booking',
  templateUrl: './trip-booking.component.html',
  styleUrls: ['./trip-booking.component.css']
})
export class TripBookingComponent implements OnInit {
  @ViewChild('formTrip', { static: false }) formTrip: OFormComponent;
  @ViewChild('formBooking', { static: false }) formBooking: OFormComponent;

  disabledState: boolean = false; // State to enable or disable a button
  valor: Number; // Value to control the button disabled state
  private bookingService: OntimizeService;
  numBooking: Number;

  constructor(public injector: Injector,
    protected dialogService: DialogService,
    private snackBarService: SnackBarService) { 
      this.bookingService = this.injector.get(OntimizeService);
    }

  ngOnInit() {
    //this.configureService();
  }

  signUp(): void {
    // Show a confirmation dialog when attempting to make a booking
    this.dialogService.confirm('Booking confirm', 'Do you really want to confirm?');
    this.dialogService.dialogRef.afterClosed().subscribe(result => {
      if (result) {
        // If the booking is confirmed, get the trip ID and insert it into the booking form
        let getIdTrip = this.formTrip.getFieldValue("id_trip");
        this.formBooking.setFieldValue("id_trip", getIdTrip);
        this.formBooking.insert();
      }
    });
  }

  freeSeatsValue(event){
    this.valor = this.formTrip.getFieldValue("free_seats");
  }
  
  isBooking(){
    console.log(this.formTrip.getFieldValue("id_trip"))
    const conf = this.bookingService.getDefaultServiceConfiguration('bookings');
    this.bookingService.configureService(conf);
    // Get the number of available cars and show an alert if there are none
    this.bookingService.query({id_trip: this.formTrip.getFieldValue("id_trip")}, ['numberUserBooking'], 'userIsInBooking').subscribe(
      res => {

        this.getUserBookings(res.data[0].numberUserBooking);
      }
    );
   
  }
  getUserBookings(num: Number) {
    this.numBooking = num;
    console.log(this.numBooking)
  }

  configureService() {
    // Get the default configuration of the 'bookings' service and configure the 'bookingService'
    const conf = this.bookingService.getDefaultServiceConfiguration('bookings');
    this.bookingService.configureService(conf);
  }
}

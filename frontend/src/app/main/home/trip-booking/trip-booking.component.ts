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
  valor: string; // Value to control the button disabled state
  private bookingService: OntimizeService;

  constructor(public injector: Injector,
    protected dialogService: DialogService,
    private snackBarService: SnackBarService) { }

  ngOnInit() {
    this.configureService();
  }

  updateButton() {
    // Update the button state based on the numeric value of 'valor'
    if (parseInt(this.valor) == 0) {
      this.disabledState = true; // Disable the button if the value is zero
    }
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
 

  configureService() {
    // Get the default configuration of the 'bookings' service and configure the 'bookingService'
    const conf = this.bookingService.getDefaultServiceConfiguration('bookings');
    this.bookingService.configureService(conf);
  }
}

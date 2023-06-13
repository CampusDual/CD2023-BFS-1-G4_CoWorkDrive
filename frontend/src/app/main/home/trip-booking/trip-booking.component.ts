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

  disabledState: boolean = false;
  valor: string;
  private bookingService: OntimizeService;

  constructor(public injector: Injector,    
    protected dialogService: DialogService,
    private snackBarService: SnackBarService) { }

  ngOnInit() {
    this.configureService();
    //this.updateButton();
    //console.log(document.getElementById("free_seats").textContent);
  }

  updateButton() {
    if(parseInt(this.valor) == 0){
      this.disabledState = true;
    }
  }

  signUp():void{
      this.dialogService.confirm('Booking confirm', 'Do you really want to confirm?');
      this.dialogService.dialogRef.afterClosed().subscribe( result => {
        if(result) {
          let getIdTrip = this.formTrip.getFieldValue("id_trip");
          this.formBooking.setFieldValue("id_trip",getIdTrip);
          this.formBooking.insert();
        }
      });
    }
    /*if(resp == null){
      this.snackBarService.open("No puedes reservar en coches sin asientos disponibles");
    }*/

  configureService(){
    const conf = this.bookingService.getDefaultServiceConfiguration('bookings');
    this.bookingService.configureService(conf);
  }
}

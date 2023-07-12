import { formatDate } from '@angular/common';
import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { MatDialogRef } from '@angular/material';
import { ActivatedRoute, Router } from '@angular/router';
import { DialogService, OFormComponent, OSlideToggleComponent, OntimizeService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-trip-detail',
  templateUrl: './trip-detail.component.html',
  styleUrls: ['./trip-detail.component.css']
})
export class TripDetailComponent implements OnInit {
  @ViewChild('formTrip', { static: false }) formTrip: OFormComponent;
  @ViewChild('switchDestination', { static: false }) switchDestination: OSlideToggleComponent;
  
  private tripService: OntimizeService;
  private headquarterService: OntimizeService;
  idTrip: number;

  public minDate: string;
  public maxDate: string;
  public switchDestinationState: boolean = false;

  private bookingService: OntimizeService;
  public bookingsNumber: Number;
  
  private notificationService: OntimizeService;

  constructor(
    private actRoute: ActivatedRoute,
    public router: Router,
    public injector: Injector,
    protected dialogService: DialogService,
    public dialogRef: MatDialogRef<TripDetailComponent>
    ) {
    this.tripService = this.injector.get(OntimizeService);
    this.headquarterService = this.injector.get(OntimizeService);
    this.bookingService = this.injector.get(OntimizeService);
    this.notificationService = this.injector.get(OntimizeService);
    this.router = router;
  }
  
  ngOnInit() {
    this.minDate = formatDate(Date.now(), 'MM-dd-yyyy', 'en-US');
    this.maxDate = formatDate(this.getMaxDate(), 'MM-dd-yyyy', 'en-US');

  }

  getMaxDate(): Date{
    let dateMonth = new Date();
    dateMonth.setMonth(dateMonth.getMonth() + 6);
    return dateMonth;
  }

  updateTrip(): void {
    // Display a confirmation dialog when attempting to update a trip
    this.dialogService.confirm('Trip update', 'Do you really want to confirm?');
    this.dialogService.dialogRef.afterClosed().subscribe(result => {
      if (result) {
        if(this.switchDestinationState){
          this.formTrip.setFieldValue("destination_image","default.png");
          this.configureServiceTrip();
          this.formTrip.update();
          this.sendNotificationUpdate(this.formTrip.getFieldValue("id_trip"));
        } else {
          this.configureServiceHeadquarter();
          this.headquarterService.query({id_headquarter: this.formTrip.getFieldValue("id_headquarter")},['id_headquarter', 'headquarter_destination_title',
        'headquarter_destination_address', 'image_headquarter_name'],'headquarter').subscribe(
            res=>{
              this.formTrip.setFieldValue("destination_title",res.data[0].headquarter_destination_title);
              this.formTrip.setFieldValue("destination_address",res.data[0].headquarter_destination_address);
              this.formTrip.setFieldValue("destination_image",res.data[0].image_headquarter_name);
              this.configureServiceTrip();
              this.formTrip.update();
              this.sendNotificationUpdate(this.formTrip.getFieldValue("id_trip"));
            }
          )
        }
      }
    });
  }

  hasBookingsAndSetDestination(){
    this.configureServiceTrip();
    // Get the number of available cars and show an alert if there are none
    this.tripService.query({id_trip: this.formTrip.getFieldValue("id_trip")}, ['number_bookings'], 'numberTripsOnBooking').subscribe(
      res => {
        this.getNumberBookings(res.data[0].number_bookings);
      }
    );
    this.configureServiceHeadquarter();
    this.headquarterService.query({headquarter_destination_title: this.formTrip.getFieldValue("destination_title")},['headquarter_quantity'],'headquarterQuantity').subscribe(
      res=>{
        if(res.data[0].headquarter_quantity != 0){
          this.headquarterService.query({headquarter_destination_title: this.formTrip.getFieldValue("destination_title")},['id_headquarter'],'headquarter').subscribe(
            resData=>{
            this.formTrip.setFieldValue("id_headquarter",resData.data[0].id_headquarter);
            this.switchDestination.setValue(false);
            })
        } else {
          this.switchDestination.setValue(true);
        }
      }
    )
  }

  getNumberBookings(bookingsNumber: Number){
    this.bookingsNumber = bookingsNumber;
    if(this.bookingsNumber !=0){
      this.dialogService.alert("There are some bookings!","Be careful with changes as there are bookings made");
    }
  }

  sendNotificationUpdate(idTrip: Number){
    this.configureServiceNotification();
    this.notificationService.insert({id_trip: idTrip},"notification").subscribe(
      res=>{
        this.dialogRef.close();
      });
  }

  deleteTrip(): void{
      // Show a confirmation dialog
      this.dialogService.confirm('Trip delete', 'Do you really want to confirm?');
      // Subscribe to dialog close
      this.dialogService.dialogRef.afterClosed().subscribe( result => {
        if(result) {
          /* this.configureServiceTripHistorical();
          this.tripHistoricalsService.insert({
            origin_title: this.formTrip.getFieldValue("origin_title"),
            origin_address: this.formTrip.getFieldValue("origin_address"),
            destination_title: this.formTrip.getFieldValue("destination_title"),
            destination_address: this.formTrip.getFieldValue("destination_address"),
            date: this.formTrip.getFieldValue("date"),
            time: this.formTrip.getFieldValue("time"),
            id_user: this.formTrip.getFieldValue("id_user"),
            id_car: this.formTrip.getFieldValue("id_car"), 
            id_trip: this.formTrip.getFieldValue("id_trip")
          },'tripHistorical').subscribe(
            res=>{}
          ); */

          //Cambiar localización de la inserción de la notificación para que se realice cuando se haya confirmado el borrado
          this.sendNotificationDelete(this.formTrip.getFieldValue("id_trip"),this.formTrip.getFieldValue("origin_title"),this.formTrip.getFieldValue("destination_title"),this.formTrip.getFieldValue("date"));
          
          //Ahora eliminamos el viaje en sí
          this.configureServiceTrip();
          this.tripService.update({id_trip: this.formTrip.getFieldValue("id_trip")}, {active: false}, 'trip').subscribe(
            res=>{
              this.dialogRef.close();
            });
        }
      });
  }
  
  sendNotificationDelete(idTrip: Number, origin_title: String, destination_title: String, date: Date){
    this.configureServiceNotification();
    const textNotification = "has canceled";
    this.notificationService.insert({id_trip: idTrip, text_notification: textNotification},"notificationDelete").subscribe(
      res=>{
        this.dialogRef.close();
      });
  }

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

  // Function to convert a date into a readable date format
  convertDate(date: Date){
    const newDate = new Date(date);
    return (newDate.toLocaleDateString());
  }
 
  configureServiceTrip() {
    // Get the default configuration of the 'trips' service and configure the 'tripService' accordingly
    const conf = this.tripService.getDefaultServiceConfiguration('trips');
    this.tripService.configureService(conf);
  }
  
  configureServiceBooking() {
    // Get the default configuration of the 'trips' service and configure the 'tripService' accordingly
    const conf = this.bookingService.getDefaultServiceConfiguration('bookings');
    this.bookingService.configureService(conf);
  }
  
  configureServiceNotification() {
    // Get the default configuration of the 'trips' service and configure the 'tripService' accordingly
    const conf = this.notificationService.getDefaultServiceConfiguration('notifications');
    this.notificationService.configureService(conf);
  }

  configureServiceHeadquarter() {
    // Get the default configuration of the 'trips' service and configure the 'tripService' accordingly
    const conf = this.headquarterService.getDefaultServiceConfiguration('headquarters');
    this.headquarterService.configureService(conf);
  }

  getSwitchValue(){
    this.switchDestinationState = this.switchDestination.getValue();
  }

  setNewDestinationValues(){    
    this.configureServiceHeadquarter();
    this.headquarterService.query({id_headquarter: this.formTrip.getFieldValue("id_headquarter")},['headquarter_destination_title',
    'headquarter_destination_address', 'image_headquarter_name'],'headquarter').subscribe(
      res=>{
        this.formTrip.setFieldValue("destination_title",res.data[0].headquarter_destination_title);
        this.formTrip.setFieldValue("destination_address",res.data[0].headquarter_destination_address);
      })
  }
}

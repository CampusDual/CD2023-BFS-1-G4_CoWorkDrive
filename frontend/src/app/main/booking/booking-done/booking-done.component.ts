import { Component, Injector, Input, OnInit, ViewChild } from '@angular/core';
import { ValidatorFn } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { DialogService, OFormComponent, OTableComponent, OValidators, OntimizeService } from 'ontimize-web-ngx';
import { StarRatingComponent } from './star-rating/star-rating.component';

@Component({
  selector: 'app-booking-done',
  templateUrl: './booking-done.component.html',
  styleUrls: ['./booking-done.component.css']
})
export class BookingDoneComponent implements OnInit {
  @ViewChild('formRate', { static: false }) formRate: OFormComponent;
  @ViewChild('tableBookingsDone', { static: false }) tableBookingsDone: OTableComponent;
  @ViewChild('starRate', { static: false }) starRate: StarRatingComponent;
  private ratingService: OntimizeService;
  // Validators for the number of seats
  validatorNumberRate: ValidatorFn[] = [];
  rate: Number;

  constructor(public injector: Injector,
    protected dialogService: DialogService,
    private actRoute: ActivatedRoute,
    public router: Router) { 
    this.validatorNumberRate.push(OValidators.patternValidator(/^[1-5]$/, 'hasValidNumber'));
    this.ratingService = this.injector.get(OntimizeService);
  }

  ngOnInit() {
  }

  // Function to convert a date into a readable date format
  convertDate(date: Date){
   const newDate = new Date(date);
   return (newDate.toLocaleDateString());
 }

 // Function to convert a time into a readable time format
 convertTime(hour: Date){
   const newTime = new Date(hour);
   return (newTime.toLocaleTimeString());
 }

 insertRate():void{
  this.configurationRatingsService();
  this.dialogService.confirm('Rate register', 'Do you really want to confirm?');
  this.dialogService.dialogRef.afterClosed().subscribe(result => {
    if(this.starRate.selectedValue<1){
      this.dialogService.alert("Puntuación errónea", "La puntuación no puede ser 0")
    } else if (result) {
      const valuesSelected = this. tableBookingsDone.getExpandableItems();
      this.formRate.setFieldValue("id_booking",valuesSelected[0].id_booking);
      this.formRate.setFieldValue("id_driver",valuesSelected[0].id_driver);
      this.formRate.setFieldValue("rate",this.starRate.selectedValue);
      this.formRate.insert();
      this.reloadComponent();
    }
  });
 }

 isRated(){
  this.configurationRatingsService();
  const valuesSelected = this.tableBookingsDone.getExpandableItems();
  this.ratingService.query({id_trip: valuesSelected[0].id_trip, id_booking: valuesSelected[0].id_booking}, ['rate'], 'isRated').subscribe(
    res => {
      if(res.data[0] != null){
        this.formRate.setFieldValue("rate",res.data[0].rate);
        this.knowRate(res.data[0].rate);
      } else {
        this.knowRate(0);
      }
    }
  );
 }

 knowRate(rate: Number){
    this.rate = rate;
 }

 configurationRatingsService(){
  const conf = this.ratingService.getDefaultServiceConfiguration('ratings');
  this.ratingService.configureService(conf);
 }

 reloadComponent() {
  this.router.routeReuseStrategy.shouldReuseRoute = () => false;
  this.router.onSameUrlNavigation = 'reload';
  this.router.navigate([this.router.url]);
}
}

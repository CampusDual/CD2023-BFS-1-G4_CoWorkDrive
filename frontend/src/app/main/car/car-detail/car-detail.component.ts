import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { ValidatorFn } from '@angular/forms';
import { MatDialogRef } from '@angular/material';
import { DialogService, OFormComponent, OntimizeService, SnackBarService, OValidators, OSnackBarConfig } from 'ontimize-web-ngx';

@Component({
  selector: 'app-car-detail',
  templateUrl: './car-detail.component.html',
  styleUrls: ['./car-detail.component.css']
})
export class CarDetailComponent implements OnInit {
  @ViewChild('formCar', { static: false }) formCar: OFormComponent;
  private carService: OntimizeService;
  private tripService: OntimizeService;
  
  // Validators for car registration
  validatorCarRegistration: ValidatorFn[] = [];
  // Validators for number of seats
  validatorNumberSeats: ValidatorFn[] = [];

  constructor(public injector: Injector,    
    protected dialogService: DialogService,
    public dialogRef: MatDialogRef<CarDetailComponent>
    ) { 
      // Add a pattern validator for car registration
      this.validatorCarRegistration.push(OValidators.patternValidator(/(([A-Z]{1}[A-Z]{0,1})(\d{4})([A-Z]{1}[A-Z]{0,1}))|((\d{4})([BCDFGHJKLMNPRSTVWXYZ]{3}))/, 'hasValidCarRegisitration'));
      // Add a pattern validator for number of seats
      this.validatorNumberSeats.push(OValidators.patternValidator(/^[1-9]$/,'hasValidNumber'));
      this.carService = this.injector.get(OntimizeService);
      this.tripService = this.injector.get(OntimizeService);
  }

  ngOnInit() {
    this.configureServiceCar();
  }

  // Function to update car data
  updateCar(): void{
      // Show a confirmation dialog
      this.dialogService.confirm('Car update', 'Do you really want to confirm?');
      // Subscribe to dialog close
      this.dialogService.dialogRef.afterClosed().subscribe( result => {
        if(result) {
          // Set the form field values with the current values
          this.formCar.setFieldValue("id_car", this.formCar.getFieldValue("id_car"));
          this.formCar.setFieldValue("seats",this.formCar.getFieldValue("seats"));
          this.formCar.setFieldValue("car_registration",this.formCar.getFieldValue("car_registration"));
          this.formCar.setFieldValue("id_color",this.formCar.getFieldValue("id_color"));
          this.formCar.setFieldValue("id_car_brand",this.formCar.getFieldValue("id_car_brand"));
          this.formCar.setFieldValue("id_car_model",this.formCar.getFieldValue("id_car_model"));
          // Perform the form update
          this.formCar.update();
          this.dialogRef.close();
        }
      });
  }

  // Function to clear car data
  clearCar(): void{
    this.formCar.clearData();
  }

  deleteCar(): void{
    // Show a confirmation dialog
    this.dialogService.confirm('Car delete', 'Do you really want to confirm?');
    // Subscribe to dialog close
    this.dialogService.dialogRef.afterClosed().subscribe( result => {
      if(result) {
        // Perform the form update
        this.carService.delete({id_car: this.formCar.getFieldValue("id_car")}, 'car').subscribe(
          res=>{
            this.dialogRef.close();
          });
      }
    });
}

updateActiveCar(): void{
  // Show a confirmation dialog
  this.dialogService.confirm('Car delete', 'Do you really want to confirm?');
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
      
      this.configureServiceTrip();
      this.tripService.query({id_car: this.formCar.getFieldValue("id_car"), active: true},['number_trips'],'scheduledTrips').subscribe(
        res=>{
          if(res.data[0].number_trips == 0){
            this.configureServiceCar();
            this.carService.update({id_car: this.formCar.getFieldValue("id_car")}, {active: false}, 'car').subscribe(
              res=>{
                this.dialogRef.close();
              })
          } else {
            this.dialogService.alert("Delete action no possible", "You cannot delete a car with scheduled trips");
          }
        }
      )
    }
  });
}

  // Configure the car service
  configureServiceCar(){
    const conf = this.carService.getDefaultServiceConfiguration('cars');
    this.carService.configureService(conf);
  }

  // Configure the trip service
  configureServiceTrip(){
    const conf = this.tripService.getDefaultServiceConfiguration('trips');
    this.tripService.configureService(conf);
  }
}

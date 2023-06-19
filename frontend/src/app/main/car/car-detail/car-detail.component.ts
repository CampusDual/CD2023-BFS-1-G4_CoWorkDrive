import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { ValidatorFn } from '@angular/forms';
import { DialogService, OFormComponent, OntimizeService, SnackBarService, OValidators, OSnackBarConfig } from 'ontimize-web-ngx';

@Component({
  selector: 'app-car-detail',
  templateUrl: './car-detail.component.html',
  styleUrls: ['./car-detail.component.css']
})
export class CarDetailComponent implements OnInit {
  @ViewChild('formCar', { static: false }) formCar: OFormComponent;
  private carService: OntimizeService;
  
  // Validators for car registration
  validatorCarRegistration: ValidatorFn[] = [];
  // Validators for number of seats
  validatorNumberSeats: ValidatorFn[] = [];

  constructor(public injector: Injector,    
    protected dialogService: DialogService,
    ) { 
      // Add a pattern validator for car registration
      this.validatorCarRegistration.push(OValidators.patternValidator(/(([A-Z]{1}[A-Z]{0,1})(\d{4})([A-Z]{1}[A-Z]{0,1}))|((\d{4})([BCDFGHJKLMNPRSTVWXYZ]{3}))/, 'hasValidCarRegisitration'));
      // Add a pattern validator for number of seats
      this.validatorNumberSeats.push(OValidators.patternValidator(/^[1-9]$/,'hasValidNumber'))
  }

  ngOnInit() {
    this.configureService();
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
          this.formCar.setFieldValue("car_brand",this.formCar.getFieldValue("car_brand"));
          this.formCar.setFieldValue("model",this.formCar.getFieldValue("model"));
          this.formCar.setFieldValue("seats",this.formCar.getFieldValue("seats"));
          this.formCar.setFieldValue("car_registration",this.formCar.getFieldValue("car_registration"));
          // Perform the form update
          this.formCar.update();
        }
      });
  }

  // Function to clear car data
  clearCar(): void{
    this.formCar.clearData();
  }

  // Configure the car service
  configureService(){
    const conf = this.carService.getDefaultServiceConfiguration('cars');
    this.carService.configureService(conf);
  }
}

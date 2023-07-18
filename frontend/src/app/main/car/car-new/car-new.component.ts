import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { ValidatorFn } from '@angular/forms'
import { DialogService, OFormComponent, OValidators, OntimizeService, SnackBarService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-car-new',
  templateUrl: './car-new.component.html',
  styleUrls: ['./car-new.component.css']
})
export class CarNewComponent implements OnInit {
  @ViewChild('formCar', { static: false }) formCar: OFormComponent;
  private carService: OntimizeService;

  // Validators for the car registration
  validatorCarRegistration: ValidatorFn[] = [];
  // Validators for the number of seats
  validatorNumberSeats: ValidatorFn[] = [];


  constructor(public injector: Injector,
    protected dialogService: DialogService,
    private snackBarService: SnackBarService) {
    // Custom validators are added to the validators array
    this.validatorCarRegistration.push(OValidators.patternValidator(/(([A-Z]{1}[A-Z]{0,1})(\d{4})([A-Z]{1}[A-Z]{0,1}))|((\d{4})([BCDFGHJKLMNPRSTVWXYZ]{3}))/, 'hasValidCarRegisitration'));
    this.validatorNumberSeats.push(OValidators.patternValidator(/^[1-9]$/, 'hasValidNumber'));
    this.carService = this.injector.get(OntimizeService);
  }

  ngOnInit() {
    this.configureService();
  }

  clearCar(): void {
    // Clear the car form data
    this.formCar.clearData();
  }


  insertCar(): void {
    // Show a confirmation dialog when attempting to insert a car
    this.dialogService.confirm('Car register', 'Do you really want to confirm?');
    this.dialogService.dialogRef.afterClosed().subscribe(result => {
      if (result) {
        // If the registration is confirmed, set the form values and perform the insertion
        this.formCar.setFieldValue("id_car", this.formCar.getFieldValue("id_car"));
        this.formCar.setFieldValue("seats", this.formCar.getFieldValue("seats"));
        this.formCar.setFieldValue("car_registration", this.formCar.getFieldValue("car_registration"));
        this.formCar.setFieldValue("id_color", this.formCar.getFieldValue("id_color"));
        this.formCar.setFieldValue("id_car_brand", this.formCar.getFieldValue("id_car_brand"));
        this.formCar.setFieldValue("id_car_model", this.formCar.getFieldValue("id_car_model"));
        this.formCar.insert();
      }
    });
  }

  configureService() {
    // Get the default configuration of the 'cars' service and configure the 'carService' accordingly
    const conf = this.carService.getDefaultServiceConfiguration('cars');
    this.carService.configureService(conf);
  }
}

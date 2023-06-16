import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { ValidatorFn, ValidationErrors, FormControl } from '@angular/forms'
import { DialogService, OFormComponent, OValidators, OntimizeService, SnackBarService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-car-new',
  templateUrl: './car-new.component.html',
  styleUrls: ['./car-new.component.css']
})
export class CarNewComponent implements OnInit {
  @ViewChild('formCar', { static: false }) formCar: OFormComponent;
  private carService: OntimizeService;

  validatorCarRegistration: ValidatorFn[] = [];
  validatorNumberSeats: ValidatorFn[] = [];


  constructor(public injector: Injector,    
    protected dialogService: DialogService,
    private snackBarService: SnackBarService) { 
    this.validatorCarRegistration.push(OValidators.patternValidator(/(([A-Z]{1}[A-Z]{0,1})(\d{4})([A-Z]{1}[A-Z]{0,1}))|((\d{4})([BCDFGHJKLMNPRSTVWXYZ]{3}))/, 'hasValidCarRegisitration'));
    this.validatorNumberSeats.push(OValidators.patternValidator(/^[1-9]$/,'hasValidNumber'));
  }

  ngOnInit() {
    this.configureService();
  }

  clearCar(): void{
    this.formCar.clearData();
  }

  insertCar(): void{
    this.dialogService.confirm('Car register', 'Do you really want to confirm?');
    this.dialogService.dialogRef.afterClosed().subscribe( result => {
      if(result) {
        this.formCar.setFieldValue("id_car", this.formCar.getFieldValue("id_car"));
        this.formCar.setFieldValue("car_brand",this.formCar.getFieldValue("car_brand"));
        this.formCar.setFieldValue("model",this.formCar.getFieldValue("model"));
        this.formCar.setFieldValue("seats",this.formCar.getFieldValue("seats"));
        this.formCar.setFieldValue("car_registration",this.formCar.getFieldValue("car_registration"));
        this.formCar.insert();
      }
    });
  }

  configureService(){
    const conf = this.carService.getDefaultServiceConfiguration('cars');
    this.carService.configureService(conf);
  }
}

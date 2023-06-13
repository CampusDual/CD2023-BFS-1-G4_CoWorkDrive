import { Component, OnInit } from '@angular/core';
import { ValidatorFn, ValidationErrors, FormControl } from '@angular/forms'
import { OValidators } from 'ontimize-web-ngx';

@Component({
  selector: 'app-car-new',
  templateUrl: './car-new.component.html',
  styleUrls: ['./car-new.component.css']
})
export class CarNewComponent implements OnInit {

  validatorCarRegistration: ValidatorFn[] = [];

  constructor() { 
    this.validatorCarRegistration.push(OValidators.patternValidator(/(([A-Z]{1}[A-Z]{0,1})(\d{4})([A-Z]{1}[A-Z]{0,1}))|((\d{4})([BCDFGHJKLMNPRSTVWXYZ]{3}))/, 'hasValidCarRegisitration'));
  }

  ngOnInit() {
  }

}

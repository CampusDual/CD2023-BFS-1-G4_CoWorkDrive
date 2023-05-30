import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { OntimizeWebModule } from 'ontimize-web-ngx';

import { CarRoutingModule } from './car-routing.module';
import { CarHomeComponent } from './car-home/car-home.component';


@NgModule({
  declarations: [CarHomeComponent],
  imports: [
    CommonModule,
    CarRoutingModule,
    OntimizeWebModule
  ]
})
export class CarModule { }

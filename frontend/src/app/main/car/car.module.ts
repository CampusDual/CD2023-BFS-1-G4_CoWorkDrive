import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { OntimizeWebModule } from 'ontimize-web-ngx';

import { CarRoutingModule } from './car-routing.module';
import { CarHomeComponent } from './car-home/car-home.component';
import { CarNewComponent } from './car-new/car-new.component';
import { CarDetailComponent } from './car-detail/car-detail.component';


@NgModule({
  declarations: [CarHomeComponent, CarNewComponent, CarDetailComponent],
  imports: [
    CommonModule,
    CarRoutingModule,
    OntimizeWebModule
  ]
})
export class CarModule { }

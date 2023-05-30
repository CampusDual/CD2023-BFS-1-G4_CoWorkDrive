import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CarRoutingModule } from './car-routing.module';
import { CarHomeComponent } from './car-home/car-home.component';


@NgModule({
  declarations: [CarHomeComponent],
  imports: [
    CommonModule,
    CarRoutingModule
  ]
})
export class CarModule { }

import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { TripRoutingModule } from './trip-routing.module';
import { TripHomeComponent } from './trip-home/trip-home.component';


@NgModule({
  declarations: [TripHomeComponent],
  imports: [
    CommonModule,
    TripRoutingModule
  ]
})
export class TripModule { }

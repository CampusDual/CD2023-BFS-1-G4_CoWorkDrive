import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { BookingRoutingModule } from './booking-routing.module';
import { BookingHomeComponent } from './booking-home/booking-home.component';
import { OntimizeWebModule } from 'ontimize-web-ngx';
import { BookingDoneComponent } from './booking-done/booking-done.component';


@NgModule({
  declarations: [BookingHomeComponent, BookingDoneComponent],
  imports: [
    CommonModule,
    BookingRoutingModule,
    OntimizeWebModule
  ]
})
export class BookingModule { }

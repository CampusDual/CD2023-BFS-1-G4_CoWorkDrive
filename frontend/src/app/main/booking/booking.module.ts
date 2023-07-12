import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { BookingRoutingModule } from './booking-routing.module';
import { BookingHomeComponent } from './booking-home/booking-home.component';
import { OntimizeWebModule } from 'ontimize-web-ngx';
import { BookingDoneComponent } from './booking-done/booking-done.component';
import { StarRatingComponent } from './booking-done/star-rating/star-rating.component';


@NgModule({
  declarations: [BookingHomeComponent, BookingDoneComponent,StarRatingComponent],
  imports: [
    CommonModule,
    BookingRoutingModule,
    OntimizeWebModule,
  ]
})
export class BookingModule { }

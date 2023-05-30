import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { OntimizeWebModule } from 'ontimize-web-ngx';

import { TripRoutingModule } from './trip-routing.module';
import { TripHomeComponent } from './trip-home/trip-home.component';
import { TripNewComponent } from './trip-new/trip-new.component';


@NgModule({
  declarations: [TripHomeComponent, TripNewComponent],
  imports: [
    CommonModule,
    TripRoutingModule,
    OntimizeWebModule
  ]
})
export class TripModule { }

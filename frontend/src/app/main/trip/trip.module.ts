import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { OntimizeWebModule } from 'ontimize-web-ngx';

import { TripRoutingModule } from './trip-routing.module';
import { TripHomeComponent } from './trip-home/trip-home.component';
import { TripNewComponent } from './trip-new/trip-new.component';
import { TripDetailComponent } from './trip-detail/trip-detail.component';
import { OChartModule } from 'ontimize-web-ngx-charts';
import { TripDoneComponent } from './trip-done/trip-done.component';
import { TripDetailDoneComponent } from './trip-detail-done/trip-detail-done.component';


@NgModule({
  declarations: [TripHomeComponent, TripNewComponent, TripDetailComponent, TripDoneComponent, TripDetailDoneComponent],
  imports: [
    CommonModule,
    TripRoutingModule,
    OntimizeWebModule,
    OChartModule
  ]
})
export class TripModule { }

import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { NotificationRoutingModule } from './notification-routing.module';
import { NotificationHomeComponent } from './notification-home/notification-home.component';
import { OntimizeWebModule } from 'ontimize-web-ngx';


@NgModule({
  declarations: [NotificationHomeComponent],
  imports: [
    CommonModule,
    NotificationRoutingModule,
    OntimizeWebModule
  ]
})
export class NotificationModule { }

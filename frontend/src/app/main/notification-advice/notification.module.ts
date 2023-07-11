import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { NotificationRoutingModule } from './notification-routing.module';
import { NotificationHomeComponent } from './notification-home/notification-home.component';
import { OntimizeWebModule } from 'ontimize-web-ngx';
import { OTableTranslateMessage } from './notification-home/renderer-translate';


@NgModule({
  declarations: [NotificationHomeComponent,OTableTranslateMessage],
  imports: [
    CommonModule,
    NotificationRoutingModule,
    OntimizeWebModule
  ]
})
export class NotificationModule { }

import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { NotificationHomeComponent } from './notification-home/notification-home.component';


const routes: Routes = [  
  {
    path : '',
    component: NotificationHomeComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class NotificationRoutingModule { }

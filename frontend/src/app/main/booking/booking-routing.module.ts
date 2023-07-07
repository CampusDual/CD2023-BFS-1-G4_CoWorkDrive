import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { BookingHomeComponent } from './booking-home/booking-home.component';
import { BookingDoneComponent } from './booking-done/booking-done.component';


const routes: Routes = [
  {
    path: 'scheduled',
    component: BookingHomeComponent
  },
  {
    path: 'done',
    component: BookingDoneComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class BookingRoutingModule { }

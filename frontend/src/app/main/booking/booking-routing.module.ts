import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { BookingHomeComponent } from './booking-home/booking-home.component';


const routes: Routes = [
  {
    path: '',
    component: BookingHomeComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class BookingRoutingModule { }

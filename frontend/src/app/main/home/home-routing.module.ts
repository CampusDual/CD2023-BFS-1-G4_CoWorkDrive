import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { HomeComponent } from './home.component';
import { TripBookingComponent } from './trip-booking/trip-booking.component';

const routes: Routes = [
  {
    path: '',
    component: HomeComponent
  },
  {
    path : ':id_trip',
    component: TripBookingComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class HomeRoutingModule { }

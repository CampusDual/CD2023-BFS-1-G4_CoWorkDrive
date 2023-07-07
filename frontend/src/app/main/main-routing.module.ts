import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuardService } from 'ontimize-web-ngx';

import { MainComponent } from './main.component';

export const routes: Routes = [
  {
    path: '',
    component: MainComponent,
    canActivate: [AuthGuardService],
    children: [
      { path: '', redirectTo: 'home', pathMatch: 'full' },
      { path: 'home', loadChildren: () => import('./home/home.module').then(m => m.HomeModule) },
      { path: 'car', loadChildren: () => import('./car/car.module').then(m => m.CarModule) },
      { path: 'trip', loadChildren: () => import('./trip/trip.module').then(m => m.TripModule) },
      { path: 'booking', loadChildren: () => import('./booking/booking.module').then(m => m.BookingModule) },
      { path: 'notification', loadChildren: () => import('./notification-advice/notification.module').then(m => m.NotificationModule) }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class MainRoutingModule { }

import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

export const routes: Routes = [
  { path: 'main', loadChildren: () => import('./main/main.module').then(m => m.MainModule) },
  { path: 'login', loadChildren: () => import('./login/login.module').then(m => m.LoginModule) },
  { path: 'booking', loadChildren: () => import('./main/booking/booking.module').then(m => m.BookingModule) },
  { path: 'car', loadChildren: () => import('./main/car/car.module').then(m => m.CarModule) },
  { path: 'trip', loadChildren: () => import('./main/trip/trip.module').then(m => m.TripModule) },
  { path: 'notification', loadChildren: () => import('./main/notification-advice/notification.module').then(m => m.NotificationModule) },
  { path: '', redirectTo: 'main', pathMatch: 'full' },
];

const opt = {
  enableTracing: false
  // true if you want to print navigation routes
};

@NgModule({
  imports: [RouterModule.forRoot(routes, opt)],
  exports: [RouterModule],
  providers: []
})
export class AppRoutingModule { }

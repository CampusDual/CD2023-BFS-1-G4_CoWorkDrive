import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { HomeComponent } from './home/home.component';
import { CarComponent } from './car/car.component';
import { TripComponent } from './trip/trip.component';


const routes: Routes = [
  {path: 'login', component: LoginComponent},
  { path: '', redirectTo: '/login' , pathMatch: 'full' },
  { path: 'home', component: HomeComponent },
  { path: 'car', component: CarComponent },
  { path: 'trip', component: TripComponent }
  
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

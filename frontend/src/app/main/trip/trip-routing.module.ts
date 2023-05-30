import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { TripHomeComponent } from './trip-home/trip-home.component';


const routes: Routes = [
  {
    path : '',
    component: TripHomeComponent
  },

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TripRoutingModule { }

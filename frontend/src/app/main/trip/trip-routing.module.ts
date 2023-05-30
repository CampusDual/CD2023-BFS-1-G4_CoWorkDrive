import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { TripHomeComponent } from './trip-home/trip-home.component';
import { TripNewComponent } from './trip-new/trip-new.component';


const routes: Routes = [
  {
    path : '',
    component: TripHomeComponent
  },
  {
    path : 'new',
    component: TripNewComponent
  },

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TripRoutingModule { }

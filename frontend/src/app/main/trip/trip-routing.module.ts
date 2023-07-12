import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { TripHomeComponent } from './trip-home/trip-home.component';
import { TripNewComponent } from './trip-new/trip-new.component';
import { TripDetailComponent } from './trip-detail/trip-detail.component';
import { TripDoneComponent } from './trip-done/trip-done.component';
import { TripDetailDoneComponent } from './trip-detail-done/trip-detail-done.component';


const routes: Routes = [
  {
    path : 'scheduled',
    component: TripHomeComponent
  },
  {
    path : 'done',
    component: TripDoneComponent
  },
  {
    path : 'scheduled/new',
    component: TripNewComponent
  },
  {
    path : 'scheduled/:id_trip',
    component: TripDetailComponent
  },
  {
    path : 'done/:id_trip',
    component: TripDetailDoneComponent
  }

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TripRoutingModule { }

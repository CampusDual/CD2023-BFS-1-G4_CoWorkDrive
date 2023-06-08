import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CarHomeComponent } from './car-home/car-home.component';
import { CarNewComponent } from './car-new/car-new.component';
import { CarDetailComponent } from './car-detail/car-detail.component';


const routes: Routes = [
  {
    path: '',
    component: CarHomeComponent
  },
  {
    path : 'new',
    component: CarNewComponent
  },
  {
    path : ':id_car', 
    component: CarDetailComponent
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CarRoutingModule { }

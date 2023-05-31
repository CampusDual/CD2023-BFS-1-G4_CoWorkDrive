import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CarHomeComponent } from './car-home/car-home.component';
import { CarNewComponent } from './car-new/car-new.component';


const routes: Routes = [
  {
    path: '',
    component: CarHomeComponent
  },
  {
    path : 'new',
    component: CarNewComponent
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CarRoutingModule { }

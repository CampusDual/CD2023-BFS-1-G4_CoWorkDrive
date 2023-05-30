import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CarHomeComponent } from './car-home/car-home.component';


const routes: Routes = [
  {
    path: '',
    component: CarHomeComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CarRoutingModule { }

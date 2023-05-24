import { Component, OnInit } from '@angular/core';
import { CarService } from '../services/car.service';
import { Car } from '../model/car';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-car',
  templateUrl: './car.component.html',
  styleUrls: ['./car.component.scss'],
  
})
export class CarComponent implements OnInit {
  car: Car = new Car();
  fieldsEmpty = false;
  

  constructor(private carService: CarService, private route: Router) { }

  ngOnInit() {
  }

  registerCar() {
    
    if (this.areFieldsEmpty()) {
      Swal.fire({
        icon: 'warning',
        title: 'Por favor, complete todos los campos',
        showConfirmButton: false,
        timer: 1500
      })
      return;
    }else{
      this.createCar();
    }

  }

  areFieldsEmpty(): boolean {
    return this.fieldsEmpty = (!this.car.car_brand || !this.car.model || !this.car.seats || !this.car.car_registration );
  }
  
  createCar() {

    this.car.id_contact= parseInt(sessionStorage.getItem("id_contact"));
   
    this.carService.registerCar(this.car).subscribe( response => {
      if(response){
        console.log(response);
        Swal.fire({
          icon: 'success',
          title: 'Coche registrado',
          showConfirmButton: false,
          timer: 3000
        })
        this.route.navigate(['/home']);
      } else {
        alert("Faltan campos por completar");
      }
    })

  }
}

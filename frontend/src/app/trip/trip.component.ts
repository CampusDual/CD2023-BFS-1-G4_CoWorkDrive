import { Component, OnInit } from '@angular/core';
import { Route, Router } from '@angular/router';
import { TripService } from '../services/trip.service';
import { Trip } from '../model/trip';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-trip',
  templateUrl: './trip.component.html',
  styleUrls: ['./trip.component.scss']
})
export class TripComponent implements OnInit {

  trip: Trip = new Trip();
  timeValue: string;
  fieldsEmpty = false;
  constructor(private tripService: TripService, private route: Router) { }

  ngOnInit() {
  }
  
  registerTrip() {
    
    if (this.areFieldsEmpty()) {
      Swal.fire({
        icon: 'warning',
        title: 'Por favor, complete todos los campos',
        showConfirmButton: false,
        timer: 1500
      })
      return;
    }else{
      this.createTrip();
    }

    // Aquí puedes realizar alguna acción al hacer clic en el botón de envío
    // Por ejemplo, puedes llamar al método registerCar() para enviar los datos del formulario al servidor
    
  }

  areFieldsEmpty(): boolean {
    this.fieldsEmpty = (!this.trip.origin || !this.trip.destination || !this.trip.origin || !this.timeValue );
    return this.fieldsEmpty;
  }
  createTrip() {

    this.trip.id_contact= parseInt(sessionStorage.getItem("id_contact"));
    this.trip.time = this.timeValue;
    console.log(this.trip.time);
   
    this.tripService.registerTrip(this.trip).subscribe( response => {
      if(response){
        console.log(response);
        Swal.fire({
          icon: 'success',
          title: 'Viaje guardado',
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

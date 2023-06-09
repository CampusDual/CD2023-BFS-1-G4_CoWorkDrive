import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-trip-booking',
  templateUrl: './trip-booking.component.html',
  styleUrls: ['./trip-booking.component.css']
})
export class TripBookingComponent implements OnInit {

  disabledState: boolean = false;
  valor: string;

  constructor() { }

  ngOnInit() {
    this.updateButton();
    console.log(document.getElementById("free_seats").textContent);
  }

  updateButton() {
    if(parseInt(this.valor) == 0){
      this.disabledState = true;
    }
  }

}

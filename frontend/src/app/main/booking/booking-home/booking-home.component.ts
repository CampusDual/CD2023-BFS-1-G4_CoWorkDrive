import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-booking-home',
  templateUrl: './booking-home.component.html',
  styleUrls: ['./booking-home.component.css']
})
export class BookingHomeComponent implements OnInit {

  constructor() { }

  ngOnInit() {
  }

  convertDate(date: Date){
    const newDate = new Date(date);
    return (newDate.toLocaleDateString());
  }

  convertTime(hour: Date){
    const newTime = new Date(hour);
    return (newTime.toLocaleTimeString());
  }
}

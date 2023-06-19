import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  constructor(
    private router: Router,
    private actRoute: ActivatedRoute
  ) {
  }

  ngOnInit() {
  }

  navigate() {
    // Navigate to the path '../login' relative to the current path (this.actRoute)
    this.router.navigate(['../', 'login'], { relativeTo: this.actRoute });
  }


  // Function to convert a date into a readable date format
  convertDate(date: Date){
    const newDate = new Date(date);
    return (newDate.toLocaleDateString());
  }

  // Function to convert a time into a readable time format
  convertTime(hour: Date){
    const newTime = new Date(hour);
    return (newTime.toLocaleTimeString());
  }
  
}

import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-star-rating', // Selector used to identify this component in HTML
  templateUrl: './star-rating.component.html', // Path to the associated HTML file
  styleUrls: ['./star-rating.component.css'] // Path to the associated CSS file
})
export class StarRatingComponent implements OnInit {
  ngOnInit(): void {
    // Empty implementation of the OnInit lifecycle hook
  }
  
  stars: number[] = [1, 2, 3, 4, 5]; // Array of star values available for rating
  selectedValue: number; // Holds the selected rating value
  isMouseover = true; // Tracks mouseover state
  
  // Triggered when a star is clicked
  countStar(star: number) {
    this.isMouseover = false; // Set isMouseover to false
    this.selectedValue = star; // Set the selected rating value
  }
  
  // Triggered when the mouse is over a star
  addClass(star: number) {
    if (this.isMouseover) {
      this.selectedValue = star; // Set the selected rating value if isMouseover is true
    }
  }

  // Triggered when the mouse leaves the star area
  removeClass() {
    if (this.isMouseover) {
      this.selectedValue = 0; // Set the selected rating value to 0 if isMouseover is true
    }
  }
}

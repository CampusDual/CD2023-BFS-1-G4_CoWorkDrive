import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-star-rating',
  templateUrl: './star-rating.component.html',
  styleUrls: ['./star-rating.component.css']
})
export class StarRatingComponent implements OnInit {
  ngOnInit(): void {
  }
  stars: number[] = [1, 2, 3, 4, 5];
  selectedValue: number = 0;
  isMouseover = true;
  
  countStar(star: number) {
    this.isMouseover = false;
    this.selectedValue = star;
  }
  
   addClass(star: number) {
    if (this.isMouseover) {
      this.selectedValue = star;
    }
   }
  
   removeClass() {
     if (this.isMouseover) {
        this.selectedValue = 0;
     }
   }
}

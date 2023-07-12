import { Component } from '@angular/core';

@Component({
  selector: 'o-app',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  userRating: number = 3; // Valor inicial del rating seleccionado por el usuario
}

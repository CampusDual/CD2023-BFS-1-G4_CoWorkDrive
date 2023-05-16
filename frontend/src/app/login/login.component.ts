import { Component } from '@angular/core';



@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent {
  email: string;
  password: string;

  constructor() {}

  login() {
    console.log(this.email);
    console.log(this.password);
  }
}




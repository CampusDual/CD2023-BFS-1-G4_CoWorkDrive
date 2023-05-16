import { Component } from '@angular/core';
import { Contact } from '../model/contact';
import { ContactService } from '../services/contact.service';



@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent {
  email: string;
  password: string;
  contacts : Contact[];

  constructor(private contactservice : ContactService) {}

  login() {
    console.log(this.email);
    console.log(this.password);
  }

  ngOnInit() {
   this.contactservice.getContactos().subscribe( contactslist => this.contacts= contactslist);
  }
}




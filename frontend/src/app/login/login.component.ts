import { Component } from '@angular/core';
import { Contact } from '../model/contact';
import { ContactService } from '../services/contact.service';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { SharedService } from '../services/shared.service';



@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent {
  email: string;
  password: string;
  contact : Contact = new Contact;

  constructor(private contactservice : ContactService, private route: Router, private sharedService: SharedService) {}

  login(){
    let auth = this.email + "," + this.password;
    this.contactservice.getContactos(auth).subscribe(response => {
      if(response){
        this.contact= response;
        this.message();
        sessionStorage.setItem("id_contact",this.contact.id_contact.toString())
        this.sharedService.isButtonDisabled = false;
        this.route.navigate(['/home']);
      } else {
        Swal.fire({
          icon: 'error',
          title: 'Usuario o contraseña erróneos',
          showConfirmButton: true
        })
      }
    });
  }

  ngOnInit() {
    if(sessionStorage.getItem("id_contact") != null){
      this.sharedService.isButtonDisabled = false;
      this.route.navigate(['/home']);
    }
  }

  getLoggedUser(): number {
    return this.contact.id_contact;
  }

  message(){
    Swal.fire({
      icon: 'success',
      title: 'Has iniciado sesión',
      showConfirmButton: false,
      timer: 3000
    })
  }

}




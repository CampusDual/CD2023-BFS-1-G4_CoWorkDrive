import { HttpClient, HttpHeaders } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Router } from "@angular/router";
import { Observable } from "rxjs";
import { map, tap } from "rxjs/operators";
import { Contact } from "../model/contact";
import { formatDate, registerLocaleData } from "@angular/common";
import localerES from '@angular/common/locales/es';


@Injectable({providedIn: 'root'})
export class ContactService{
    private urlEndpoint: string = 'http://localhost:8080/contacts';
    
    private header = new HttpHeaders ({'Content-Type': 'applicatio/JSON'});

    constructor(private htpp: HttpClient, private rooter: Router){

    }

    getContactos(): Observable<Contact[]>{
        return this.htpp.get(this.urlEndpoint.concat("/validar")).pipe(
            tap(
                response =>{
                    let contactos = response as Contact[];
                    contactos.forEach(contacto => console.log(contacto.first_name));
                }
            ),map(
                response =>{
                    let contactos = response as Contact[];
                    return contactos.map(contacto => {
                        registerLocaleData(localerES,'es');
                        contacto.email =  formatDate(contacto.email,'EEEE dd, MMMM yyyy','es');
                        return contacto;
                    })
                }
            ))
    }
}
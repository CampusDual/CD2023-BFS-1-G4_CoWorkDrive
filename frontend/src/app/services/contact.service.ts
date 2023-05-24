import { HttpClient, HttpHeaders } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Router } from "@angular/router";
import { Observable, throwError } from "rxjs";
import { catchError, map, tap } from "rxjs/operators";
import { Contact } from "../model/contact";
import { formatDate, registerLocaleData } from "@angular/common";
import localerES from '@angular/common/locales/es';


@Injectable({providedIn: 'root'})
export class ContactService{
    private urlEndpoint: string = 'http://localhost:8080/contacts';
    
    private header = new HttpHeaders ({'Content-Type': 'application/JSON'});

    constructor(private http: HttpClient, private rooter: Router){

    }

    getContactos(auth: String): Observable<Contact>{
        return this.http.post(this.urlEndpoint.concat("/login"), auth, {headers: this.header}).pipe(
            map(
                response => { return response as Contact; }
            ),
            catchError(
                exception => {
                    console.error(exception.error.message);
                    return throwError(() => exception);
                }
            )
        )}
}
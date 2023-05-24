import { HttpClient, HttpHeaders } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Router } from "@angular/router";
import { Observable, throwError } from "rxjs";
import { catchError, map, tap } from "rxjs/operators";
import { Car } from "../model/car";



@Injectable({providedIn: 'root'})
export class CarService{
    private urlEndpoint: string = 'http://localhost:8080/cars';
    
    private header = new HttpHeaders ({'Content-Type': 'application/JSON'});

    constructor(private http: HttpClient, private rooter: Router){

    }

    registerCar(car: Car): Observable<Car>{
        return this.http.post(this.urlEndpoint.concat("/register"), car, {headers: this.header}).pipe(
            map(
                response => { return response as Car; }
            ),
            catchError(
                exception => {
                    console.error(exception.error.message);
                    return throwError(() => exception);
                }
            )
        )}
}
import { HttpClient, HttpHeaders } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Router } from "@angular/router";
import { Observable, throwError } from "rxjs";
import { catchError, map, tap } from "rxjs/operators";
import { Trip } from "../model/trip";



@Injectable({providedIn: 'root'})
export class TripService{
    private urlEndpoint: string = 'http://localhost:8080/trips';
    
    private header = new HttpHeaders ({'Content-Type': 'application/JSON'});

    constructor(private http: HttpClient, private rooter: Router){

    }

    registerTrip(trip: Trip): Observable<Trip>{
        return this.http.post(this.urlEndpoint.concat("/register"), trip, {headers: this.header}).pipe(
            map(
                response => { return response as Trip; }
            ),
            catchError(
                exception => {
                    return throwError(() => exception);
                }
            )
        )}
}
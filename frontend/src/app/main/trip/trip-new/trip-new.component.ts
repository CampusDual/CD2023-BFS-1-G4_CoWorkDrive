import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Component, Inject, Injector, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService, DialogService, ODialogConfig, OntimizeService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-trip-new',
  templateUrl: './trip-new.component.html',
  styleUrls: ['./trip-new.component.css']
})
export class TripNewComponent implements OnInit {
  
  baseUrl: string = "http://localhost:33333/trips/trip"
  
  getValue(){
    return sessionStorage.getItem("userName");
  }

  constructor() { 
    }

  ngOnInit() {
    this.getValue();
  }

}

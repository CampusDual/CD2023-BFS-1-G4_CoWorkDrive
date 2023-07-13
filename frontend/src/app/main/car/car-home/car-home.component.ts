import { Component, ElementRef, Injector, OnInit, ViewChild } from '@angular/core';
import { OGridComponent } from 'ontimize-web-ngx';

@Component({
  selector: 'app-car-home',
  templateUrl: './car-home.component.html',
  styleUrls: ['./car-home.component.css']
})
export class CarHomeComponent implements OnInit {

  @ViewChild("grid",{static:true}) gridElement: OGridComponent;

  constructor(
    public injector: Injector) { }

  ngOnInit() {
  }

}
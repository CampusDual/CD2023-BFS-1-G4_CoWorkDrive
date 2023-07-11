import { Component, Injector, OnInit, TemplateRef, ViewChild } from '@angular/core';
import { OBaseTableCellRenderer, OTranslateService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-notification-home',
  templateUrl: './notification-home.component.html',
  styleUrls: ['./notification-home.component.css']
})
export class NotificationHomeComponent implements OnInit {

  constructor() { }

  ngOnInit() {
  }
  
  // Function to convert a date into a readable date format
  convertDate(date: Date){
    const newDate = new Date(date);
    return (newDate.toLocaleDateString());
  }
 
  // Function to convert a time into a readable time format
  convertTime(hour: Date){
    const newTime = new Date(hour);
    return (newTime.toLocaleTimeString());
  }
}  

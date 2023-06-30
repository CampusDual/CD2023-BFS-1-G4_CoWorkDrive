import { formatDate } from '@angular/common';
import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { DialogService, OFormComponent, OntimizeService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-trip-new',
  templateUrl: './trip-new.component.html',
  styleUrls: ['./trip-new.component.css']
})
export class TripNewComponent implements OnInit {
  @ViewChild('formTrip', { static: false }) formTrip: OFormComponent;
  private tripService: OntimizeService;

  public minDate: string;
  public maxDate: string;

  constructor(public injector: Injector,    
    protected dialogService: DialogService) { 
  }

  ngOnInit() {
    this.minDate = formatDate(Date.now(), 'MM-dd-yyyy', 'en-US');
    this.maxDate = formatDate(this.getMaxDate(), 'MM-dd-yyyy', 'en-US');
  }

  getMaxDate(): Date{
    let dateMonth = new Date();
    dateMonth.setMonth(dateMonth.getMonth() + 6);
    return dateMonth;
  }
  
  clearTrip(): void {
    // Clear the trip form data
    this.formTrip.clearData();
  }

  insertTrip(): void {
    // Show a confirmation dialog when attempting to insert a trip
    this.dialogService.confirm('Trip register', 'Do you really want to confirm?');
    this.dialogService.dialogRef.afterClosed().subscribe(result => {
      if (result) {
        this.formTrip.insert();
      }
    });
  }

  configureService() {
    // Get the default configuration of the 'trips' service and configure the 'tripService' accordingly
    const conf = this.tripService.getDefaultServiceConfiguration('trips');
    this.tripService.configureService(conf);
  }
}

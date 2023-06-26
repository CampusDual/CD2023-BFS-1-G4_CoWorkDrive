import { ChangeDetectorRef, Component, Injector, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material';
import { Router } from '@angular/router';
import { DialogService, OntimizeService, SQLTypes } from 'ontimize-web-ngx';
import { PieChartConfiguration } from 'ontimize-web-ngx-charts';
import { DiscreteBarChartConfiguration } from 'ontimize-web-ngx-charts';

@Component({
  selector: 'app-trip-home',
  templateUrl: './trip-home.component.html',
  styleUrls: ['./trip-home.component.css']
})
export class TripHomeComponent implements OnInit {
  
  accountAmount: any;
  public movementTypesChartParams: PieChartConfiguration;
  public chartParameters: DiscreteBarChartConfiguration;
  protected graphData: Array<Object>;
  protected criteriaValue = 5000;

  private carService: OntimizeService;
  public carsNumber: Number;

  constructor(
    protected dialog: MatDialog,
    public injector: Injector,
    public router: Router,
    protected dialogService: DialogService,
    private ontimizeService: OntimizeService,
    private cd: ChangeDetectorRef
  ) {
    this.ontimizeService.configureService(this.ontimizeService.getDefaultServiceConfiguration('trips'));
    this.ontimizeService.query({}, ['id_user'], 'numberTrips').subscribe(
      res => {
        if (res && res.data.length && res.code === 0) {
          this.accountAmount = res.data.length;
          this.adaptResult(res.data);
        }
      },
      err => console.log(err),
      () => this.cd.detectChanges()
    );
  }

  adaptResult(data: any) {
    if (data && data.length) {
      // chart data
      this.graphData = [
        {
          'key': 'number_trips',
          'values': data
        }
      ]
    }
  }

  ngOnInit() {
    this.configureService();
    
    // Get the number of available cars and show an alert if there are none
    this.carService.query({}, ['number_cars'], 'numberCars').subscribe(
      res => {
        this.carsNumber = res.data[0].number_cars;
        if (this.carsNumber == 0) {
          this.dialogService.alert('Add a car!', 'You cannot insert trips without any car');
        }
      }
    );
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

  configureService() {
    // Get the default configuration of the 'cars' service and configure the 'carService' accordingly
    const conf = this.carService.getDefaultServiceConfiguration('cars');
    this.carService.configureService(conf);
  }
}

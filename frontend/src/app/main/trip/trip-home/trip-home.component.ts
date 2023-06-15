import { Component, Injector, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material';
import { Router } from '@angular/router';
import { DialogService, OntimizeService } from 'ontimize-web-ngx';
import { TripNewComponent } from '../trip-new/trip-new.component';

@Component({
  selector: 'app-trip-home',
  templateUrl: './trip-home.component.html',
  styleUrls: ['./trip-home.component.css']
})
export class TripHomeComponent implements OnInit {
  
  private carService: OntimizeService;
  public carsNumber: Number;

  constructor(
    protected dialog: MatDialog,
    public injector: Injector,
    public router: Router,    
    protected dialogService: DialogService
    ) {
      this.carService = this.injector.get(OntimizeService);
     }

  ngOnInit() {
    this.configureService();
    this.carService.query({},['number_cars'],'numberCars').subscribe(
      res => {
        this.carsNumber = res.data[0].number_cars;
        if(this.carsNumber==0){
          this.dialogService.alert('¡Add a car!', 'You cannot insert trips without any car');
        }
      }
    );
  }

  convertDate(date: Date){
    const newDate = new Date(date);
    return (newDate.toLocaleDateString());
  }

  convertTime(hour: Date){
    const newTime = new Date(hour);
    return (newTime.toLocaleTimeString());
  }

  configureService(){
    const conf = this.carService.getDefaultServiceConfiguration('cars');
    this.carService.configureService(conf);
  }

  insertDetail(){
    this.dialog.open(TripNewComponent, {
      disableClose: false, 
      height: '350px',
      width: '800px'
  });
  }
}

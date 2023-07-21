import { formatDate } from '@angular/common';
import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { DialogService, OFormComponent, OSlideToggleComponent, OntimizeService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-trip-new',
  templateUrl: './trip-new.component.html',
  styleUrls: ['./trip-new.component.css']
})
export class TripNewComponent implements OnInit {
  @ViewChild('formTrip', { static: false }) formTrip: OFormComponent;
  @ViewChild('switchDestination', { static: false }) switchDestination: OSlideToggleComponent;
  private tripService: OntimizeService;
  private headquarterService: OntimizeService;

  public minDate: string;
  public maxDate: string;
  public switchDestinationState: boolean = false;

  constructor(public injector: Injector,    
    protected dialogService: DialogService,
    public router: Router,
    private actRoute: ActivatedRoute) { 
      this.tripService = this.injector.get(OntimizeService);
      this.headquarterService = this.injector.get(OntimizeService);
  }

  ngOnInit() {
    this.minDate = formatDate(Date.now(), 'MM-dd-yyyy', 'en-US');
    this.maxDate = formatDate(this.getMaxDate(), 'MM-dd-yyyy', 'en-US');
  }

  ngAfterViewInit(){

    
  }

  formInit(){
    if(localStorage.length > 0){
      this.formTrip.setFieldValue("origin_title", localStorage.getItem("origin_title"));
      this.formTrip.setFieldValue("origin_address", localStorage.getItem("origin_address"));
      this.formTrip.setFieldValue("destination_title", localStorage.getItem("destination_title"));
      this.formTrip.setFieldValue("destination_address", localStorage.getItem("destination_address"));
    }
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
        if(this.switchDestinationState){
          this.formTrip.setFieldValue("destination_image","default.png");
          this.configureServiceTrip();
          this.formTrip.insert();
        } else {
          this.configureServiceHeadquarter();
          this.headquarterService.query({id_headquarter: this.formTrip.getFieldValue("id_headquarter")},['id_headquarter', 'headquarter_destination_title',
        'headquarter_destination_address', 'image_headquarter_name'],'headquarter').subscribe(
            res=>{
              this.formTrip.setFieldValue("destination_title",res.data[0].headquarter_destination_title);
              this.formTrip.setFieldValue("destination_address",res.data[0].headquarter_destination_address);
              this.formTrip.setFieldValue("destination_image",res.data[0].image_headquarter_name);
              this.configureServiceTrip();
              this.formTrip.insert();
              this.reloadComponent();
            }
          )
        }
      }
    });
  }

  configureServiceTrip() {
    // Get the default configuration of the 'trips' service and configure the 'tripService' accordingly
    const conf = this.tripService.getDefaultServiceConfiguration('trips');
    this.tripService.configureService(conf);
  }

  configureServiceHeadquarter() {
    // Get the default configuration of the 'trips' service and configure the 'tripService' accordingly
    const conf = this.headquarterService.getDefaultServiceConfiguration('headquarters');
    this.headquarterService.configureService(conf);
  }

  getSwitchValue(){
    this.switchDestinationState = this.switchDestination.getValue();
  }

  setNewDestinationValues(){    
    this.configureServiceHeadquarter();
    this.headquarterService.query({id_headquarter: this.formTrip.getFieldValue("id_headquarter")},['headquarter_destination_title',
    'headquarter_destination_address', 'image_headquarter_name'],'headquarter').subscribe(
      res=>{
        this.formTrip.setFieldValue("destination_title",res.data[0].headquarter_destination_title);
        this.formTrip.setFieldValue("destination_address",res.data[0].headquarter_destination_address);
      })
  }

    // Reloads the component
    reloadComponent() {
      this.router.routeReuseStrategy.shouldReuseRoute = () => false;
      this.router.onSameUrlNavigation = 'reload';
      this.router.navigate([this.router.url]);
    }
}

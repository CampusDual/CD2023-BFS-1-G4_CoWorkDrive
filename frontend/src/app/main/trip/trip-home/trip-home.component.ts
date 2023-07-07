import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { MatDialog } from '@angular/material';
import { ActivatedRoute, Router } from '@angular/router';
import { DialogService, OTableOptions, OntimizeService, SQLTypes } from 'ontimize-web-ngx';
import { OChartComponent, PieChartConfiguration } from 'ontimize-web-ngx-charts';
import { DiscreteBarChartConfiguration } from '../../models/options/DiscreteBarChartConfiguration.class';
import { OChartPreferences } from 'ontimize-web-ngx-charts/lib/types/chart-preferences.type';
import { ChartConfigurationUtils } from '../../models/chart-configuration-utils';
import { ChartConfiguration } from '../../models/options/ChartConfiguration.class';

@Component({
  selector: 'app-trip-home',
  templateUrl: './trip-home.component.html',
  styleUrls: ['./trip-home.component.css']
})
export class TripHomeComponent implements OnInit {
  
  public movementTypesChartParams: PieChartConfiguration;
  public discreteBarChartConfiguration: DiscreteBarChartConfiguration;
  
  public dataTripsStats: Array<Object>;
  protected data: Array<Object>;

  @ViewChild('bubbleChart', {static: false}) protected bubbleChart: OChartComponent;

  private carService: OntimizeService;
  public carsNumber: Number;
  private tripService: OntimizeService;
  public tripsCurrentMonth: Number = 0;
  public tripsLastMonth: Number = 0;

  constructor(
    protected dialog: MatDialog,
    public injector: Injector,
    public router: Router,
    protected dialogService: DialogService
  ) {
    this.carService = this.injector.get(OntimizeService);
    this.tripService = this.injector.get(OntimizeService);
  }

  ngOnInit() {

    this.numberCarsQuery();
    this.tripsStatsQuery();
  
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

  numberCarsQuery() {
    // Get the default configuration of the 'cars' service and configure the 'carService' accordingly
    const conf = this.carService.getDefaultServiceConfiguration('cars');
    this.carService.configureService(conf);

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

  ngAfterViewInit() {
  }

  tripsStatsQuery() {
    // Get the default configuration of the 'cars' service and configure the 'carService' accordingly
    const conf = this.tripService.getDefaultServiceConfiguration('trips');
    this.tripService.configureService(conf);

    // Get the number of available cars and show an alert if there are none
    this.tripService.query({}, ['trips_current_month', 'trips_last_month'], 'historicalTrips').subscribe(
      res => {
        this.adaptResultBubble(res.data);
        this.bubbleChart.setDataArray(this.dataTripsStats);
      }
    );
  }
  
  adaptResultBubble(dataTripsStats: Array<any>) {
     let valueThisMonth: number = dataTripsStats[0].trips_current_month;
    let valueLastMonth: number = dataTripsStats[0].trips_last_month;
    if (dataTripsStats && dataTripsStats.length) {
      // chart data
      this.dataTripsStats = [
        {
          "index": 1.0,
          "size": 6.0,
          "name": "This month",
          "children": [{
            "index": 1.0,
            "name": "This month",
            "value": valueThisMonth,
            "size": 1.0
          }]
        }, {
          "index": 2.0,
          "size": 6.0,
          "name": "Last month",
          "children": [{
            "index": 2.0,
            "name": "Last month",
            "value": valueLastMonth,
            "size": 1.0
          }]
        }]
        }
    }

    protected static configureDiscreteBarChart(chartConf: DiscreteBarChartConfiguration, preferences: OChartPreferences, oTableOptions: OTableOptions): void {
      let colors: Array<string> = ['#20217B', '#373995', '#4649A6', '#6264B3', '#7E80C1'];
      preferences.selectedPalette.push();
      chartConf.agroup = true;
      chartConf.showLegend = true;
      chartConf.color = colors;
      this.configureAxisFormat(chartConf, preferences, oTableOptions);
    }

    public static configureChart(preferences: OChartPreferences, oTableOptions: OTableOptions): ChartConfiguration {
      let chartConf: ChartConfiguration = ChartConfigurationUtils.getConfigurationForType(preferences.selectedTypeChart);
      if (chartConf != undefined) {
        chartConf.xAxis = preferences.selectedXAxis;
        chartConf.yAxis = preferences.selectedYAxis;
        chartConf.xLabel = preferences.selectedXAxis;
        chartConf.yLabel = preferences.selectedYAxis.toString();
        switch (preferences.selectedTypeChart) {
          case 'discreteBar':
            this.configureDiscreteBarChart(chartConf as DiscreteBarChartConfiguration, preferences, oTableOptions);
            break;
        }
      }
  
      return chartConf;
    }

    private static configureAxisFormat(chartConf: ChartConfiguration, preferences: OChartPreferences, oTableOptions: OTableOptions): void {
      let formatCallback = TripHomeComponent.getAxisFormatCallback(preferences.selectedXAxisType, preferences.selectedXAxis, oTableOptions);
      if (formatCallback != undefined) {
        chartConf.xDataType = formatCallback;
      }
      formatCallback = TripHomeComponent.getAxisFormatCallback(preferences.selectedYAxisType, preferences.selectedYAxis[0], oTableOptions);
      if (formatCallback != undefined) {
        chartConf.yDataType = formatCallback;
      }
    }
    public static getAxisFormatCallback(axisType: number, axisName: string, oTableOptions: OTableOptions): any {
      //TODO review integer and decimal format...
      if (this.isInteger(axisType)) {
        return "intGrouped";
      } else if (this.isDecimal(axisType)) {
        if (this.isCurrency(axisName, oTableOptions)) {
          return "currency";
        } else if (this.isPercentage(axisName, oTableOptions)) {
          return "percentage";
        }
        return "float";
      } else if (this.isDate(axisType)) {
        return "time";
      }
    }
  
    public static isDate(arg: number): boolean {
      return [
        SQLTypes.DATE,
        SQLTypes.TIME,
        SQLTypes.TIMESTAMP
      ].indexOf(arg) !== -1;
    }
  
    public static isInteger(arg: number): boolean {
      return [
        SQLTypes.TINYINT,
        SQLTypes.SMALLINT,
        SQLTypes.INTEGER,
        SQLTypes.BIGINT
      ].indexOf(arg) !== -1;
    }
  
    public static isDecimal(arg: number): boolean {
      return [
        SQLTypes.FLOAT,
        SQLTypes.REAL,
        SQLTypes.DOUBLE,
        SQLTypes.NUMERIC,
        SQLTypes.DECIMAL
      ].indexOf(arg) !== -1;
    }
  
    public static isCurrency(column: string, oTableOptions: OTableOptions): boolean {
      return oTableOptions.columns.filter(oCol => oCol.type === "currency" && oCol.attr === column).length == 1;
    }
  
    public static isPercentage(column: string, oTableOptions: OTableOptions): boolean {
      return oTableOptions.columns.filter(oCol => oCol.type === "percentage" && oCol.attr === column).length == 1;
    }
  }
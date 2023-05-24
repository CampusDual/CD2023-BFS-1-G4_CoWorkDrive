import { Component, OnInit } from '@angular/core';
import { SharedService } from '../services/shared.service';

@Component({
  selector: 'app-heeader',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {

  constructor(public sharedService: SharedService) { }

  ngOnInit() {
  }

  logout(){
    sessionStorage.clear();
    this.sharedService.isButtonDisabled = true;
  }
}

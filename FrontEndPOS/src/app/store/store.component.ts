import { Component, OnInit } from '@angular/core';


@Component({
  selector: 'app-store',
  templateUrl: './store.component.html',
  styleUrls: ['./store.component.scss']
})
export class StoreComponent implements OnInit {

  //Will set this to an environmental value later
  public storeID:number = 1;
  public tables = [];
  constructor() { }

  ngOnInit(): void {
  }

}

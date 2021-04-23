import { ResolvedStaticSymbol } from '@angular/compiler';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-store',
  templateUrl: './store.component.html',
  styleUrls: ['./store.component.scss']
})
export class StoreComponent implements OnInit {

  //Class parameters
  public storeID:number;
  public storeName:string;
  //public tables:POSTableComponent[];

  //debug paramter
  //When this is set to true, the application is developer mode.
  //Developer mode means that we don't make an api call to fill in this class parameters.
  private debug:boolean = true;
  
  constructor() { }

  ngOnInit(): void {
    //checking the duebug value for dev mode.
    if (this.debug) {
      this.storeID = 1;
      this.storeName = "ChickunNChili";
      //this.tables = this.getDevTables();
    }
  }

  /* private getDevTables():POSTableComponent[] {
    let tableArray = [[1, 1, 1, "Dine In 1", 1],
        [2, 1, 1, "Dine In 2", 1],
        [3, 1, 1, "Take Out 1", 1],
        [4, 1, 1, "Take Out 2", 1],
        [5, 1, 1, "Bar 1", 1],
        [6, 1, 1, "Bar 2", 1],
        [7, 1, 1, "Bar 3", 1],
        [8, 1, 1, "Bar 4", 1],
        [9, 1, 1, "Bar 5", 1],
        [10, 1, 1, "Bar 6", 1],
        [11, 1, 1, "Patio 1", 1],
        [12, 1, 1, "Patio 2", 1],
        [13, 1, 1, "Patio 3", 1],
        [14, 1, 1, "Patio 4", 1],
        [15, 1, 1, "Patio 5", 1]
      ];
    let returnTables:POSTableComponent[];

    tableArray.forEach(element => {
      let temptable:POSTableComponent = new POSTableComponent();
      temptable.makeTable(element.values()[0],element.values()[1],element.values()[2],element.values()[3],element.values()[4]);
      returnTables.push(temptable);
    });

    return returnTables;
  } */
}

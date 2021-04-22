import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-postable',
  templateUrl: './postable.component.html',
  styleUrls: ['./postable.component.scss']
})
export class POSTableComponent implements OnInit {

  //Class Parameters
  public ID:number;
  public sortValue:number;
  public isActive:number;
	public TableName:string;
	public StoreID:number;
  
  constructor(){}

  ngOnInit(): void {
  }

  makeTable(_ID:number, _sortValue:number, _isActive:number, _TableName:string, _StoreID:number) { 
    this.ID = _ID;
    this.sortValue = _sortValue;
    this.isActive = _isActive;
    this.TableName = _TableName;
    this.StoreID = _StoreID;
  }
}

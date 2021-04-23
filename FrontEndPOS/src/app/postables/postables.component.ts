import { Component, OnInit } from '@angular/core';
import { table } from "../postables/models/table";
import { check } from "../postables/models/check";


@Component({
  selector: 'app-postables',
  templateUrl: './postables.component.html',
  styleUrls: ['./postables.component.scss']
})
export class POSTablesComponent implements OnInit {

  //StoreID:number = StoreID;
  UserID:number;
  tables:table [];
  checks:check [];

  constructor() { }

  ngOnInit(): void {
  }

}

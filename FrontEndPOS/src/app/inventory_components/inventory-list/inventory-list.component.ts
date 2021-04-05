import { Component, OnInit } from '@angular/core';
import { MenuItem } from '../inventory_service/menu-item';
import { InventoryService } from '../inventory_service/inventory.service';
import { Transporter } from '../inventory_service/transporter';

@Component({
  selector: 'app-inventory-list',
  templateUrl: './inventory-list.component.html',
  styleUrls: ['./inventory-list.component.scss']
})
export class InventoryListComponent implements OnInit {

  public inventoryItems:MenuItem[] = [];
  public transporterArr:Transporter[] = [];

  constructor(private inventoryService: InventoryService) { }

  ngOnInit(): void {

    this.inventoryItems = [
      {
        function: "Read",
        object: "MenuItem",
        itemName: "Hamburger",
        menuID: 1235,
        price:  5.99,
        priorityScore: 2,
        executionTime:  10
      },
      {
        function: "Read",
        object: "MenuItem",
        itemName: "Ham and Cheese",
        menuID: 1236,
        price:  2.99,
        priorityScore: 3,
        executionTime:  2
      },
      {
        function: "Read",
        object: "MenuItem",
        itemName: "Omelet",
        menuID: 1237,
        price:  4.99,
        priorityScore: 2,
        executionTime:  7
      }

    ]
    
    //this.inventoryService.getdata().subscribe(data => { this.inventoryItems = data;})
    //this.inventoryService.getdata().subscribe(data => { this.transporterArr = data;})
  }

  createPost(){
    const data : MenuItem  = {
      function: "API_CREATE",
      object: "MenuItem",
      itemName: "BLT",
      menuID: 1234,
      price:  4.99,
      priorityScore: 1,
      executionTime:  5
    }
    this.inventoryService.createPost(data).subscribe(inventoryClass => { 
      this.inventoryItems.push(inventoryClass);
    });
  }

  deleteRow(id){
    for(let i = 0; i < this.inventoryItems.length; ++i){
        if (this.inventoryItems[i].menuID === id) {
            this.inventoryItems.splice(i,1);
        }
    }
  }
  addBLT(){
    var data : MenuItem  = {
      function: "Create",
      object: "MenuItem",
      itemName: "BLT",
      menuID: 1238,
      price:  4.99,
      priorityScore: 1,
      executionTime:  5
    }
    for(let i = 0; i < this.inventoryItems.length; ++i){
      if (this.inventoryItems[i].menuID === data.menuID) {
          data.menuID = data.menuID + 1
      }
  }
    this.inventoryItems.push(data);
  }

  addItem(){
    const data : Transporter = {
      function: "API_CREATE",
      object: "MenuItem",
      payload: [
        "Grilled Cheese",
        1239,
        2.99,
        1,
        5
      ]
    }
    for(let i = 0; i < this.transporterArr.length; ++i){
      if (this.transporterArr[i].payload[1] === data.payload[1]) {
        data.payload[1] = data.payload[1] + 1
      }
  }
  this.inventoryService.createTransporterPost(data).subscribe(transporter => { 
    this.transporterArr.push(transporter);
  });
  }
}

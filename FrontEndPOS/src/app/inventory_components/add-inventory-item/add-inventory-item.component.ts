import { Component, OnInit } from '@angular/core';
import { InventoryService } from '../inventory_service/inventory.service';
import { Transporter } from '../inventory_service/transporter';
import { Router } from '@angular/router';



@Component({
  selector: 'app-add-inventory-item',
  templateUrl: './add-inventory-item.component.html',
  styleUrls: ['./add-inventory-item.component.scss']
})
export class AddInventoryItemComponent implements OnInit {
    sortValue: number;
    isActive: number;
    menuID: number;
    itemName: string;
    price: number;
    priorityScore: number;
    executionTime: number;
    transporterArr: Transporter [];

  constructor(private inventoryService: InventoryService, private router: Router) { }

  ngOnInit(): void {
  }

  addMenuItem(){
    const transporter:Transporter = {
      function: "create",
      object: "menuitem",
      payload: [
        this.sortValue,
        this.isActive,
        this.menuID,
        this.itemName,
        this.price,
        this.priorityScore,
        this.executionTime,
      ]
    }
    console.log(transporter);
    this.inventoryService.createTransporterPost(transporter).subscribe();

    this.router.navigate(['/', 'inventory']);
  }

}

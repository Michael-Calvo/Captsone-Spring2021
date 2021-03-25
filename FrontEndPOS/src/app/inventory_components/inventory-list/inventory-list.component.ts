import { Component, OnInit } from '@angular/core';
import { InventoryClass } from '../inventory_service/inventory-class';
import { InventoryService } from '../inventory_service/inventory.service';

@Component({
  selector: 'app-inventory-list',
  templateUrl: './inventory-list.component.html',
  styleUrls: ['./inventory-list.component.scss']
})
export class InventoryListComponent implements OnInit {

  public inventoryItems:InventoryClass[] = [];

  constructor(private inventoryService: InventoryService) { }

  ngOnInit(): void {
    this.inventoryService.getdata().subscribe(data => { this.inventoryItems = data;})
  }

}

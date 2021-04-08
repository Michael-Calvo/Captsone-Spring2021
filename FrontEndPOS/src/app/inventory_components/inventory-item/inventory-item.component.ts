import { Component, OnInit, Input } from '@angular/core';
import { MenuItem } from '../inventory_service/menu-item';

@Component({
  selector: 'app-inventory-item',
  templateUrl: './inventory-item.component.html',
  styleUrls: ['./inventory-item.component.scss']
})
export class InventoryItemComponent implements OnInit {

  @Input() menuItem: MenuItem;

  constructor() { }

  ngOnInit(): void {
  }

  setClasses() {
    let classes = {
      inventoryentry: true
    }
  }

}

import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { InventoryService } from '../inventory_service/inventory.service';
import { Transporter } from '../inventory_service/transporter';

@Component({
  selector: 'app-inventory-page',
  templateUrl: './inventory-page.component.html',
  styleUrls: ['./inventory-page.component.scss']
})
export class InventoryPageComponent implements OnInit {
  
  constructor() { }

  ngOnInit(): void {

  }

}

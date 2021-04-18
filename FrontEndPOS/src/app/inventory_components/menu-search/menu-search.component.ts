import { Component, OnInit, EventEmitter, Output } from '@angular/core';
import { Transporter } from '../inventory_service/transporter';

@Component({
  selector: 'app-menu-search',
  templateUrl: './menu-search.component.html',
  styleUrls: ['./menu-search.component.scss']
})
export class MenuSearchComponent implements OnInit {

  @Output() findMenu:EventEmitter<Transporter> = new EventEmitter<Transporter>();

  menuNumber: number = 0;
  isActive: number = 0;

  constructor() { }

  ngOnInit(): void {
  }

  menuSeek() {
    const transporter:Transporter = {
      function: "read",
      object: "menuitem",
      payload: [
        this.isActive,
        this.menuNumber
        
      ]
    }
    console.log(transporter);
    this.findMenu.emit(transporter);
  }

}

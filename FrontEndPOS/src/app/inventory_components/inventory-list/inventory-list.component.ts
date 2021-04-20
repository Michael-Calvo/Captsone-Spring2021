import { Component, OnInit, Input, ElementRef, ViewChild} from '@angular/core';
import { InventoryService } from '../inventory_service/inventory.service';
import { Transporter } from '../inventory_service/transporter';
import { Receiver } from '../inventory_service/receiver';
import { MenuItem2 } from '../inventory_service/menu-item2';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-inventory-list',
  templateUrl: './inventory-list.component.html',
  styleUrls: ['./inventory-list.component.scss']
})

export class InventoryListComponent implements OnInit {

  public transporterArr:Transporter[] = [];
  public error:string = "error detected";
  public receiver$: Observable<Receiver>;
  @Input() transporter: Transporter = new Transporter;
  @ViewChild('tableTag') myTable: ElementRef;
  

  constructor(private inventoryService: InventoryService) { }


  ngOnInit(): void {

    const data : Transporter = {
      function: "read",
      object: "menuitem",
      payload: [
        1,
        1
      ]
    }

    this.getItems(data)
    //console.log(this.receiver$)
  }



  //dummy test function
  /*addItem(){
    const data : Transporter = {
      function: "create",
      object: "menuitem",
      payload: [
        1,
        1,
        1,
        "Grilled Cheese",
        5.99,
        0,
        0
      ]
    }
  this.inventoryService.createTransporterPost(data).subscribe(transporter => { 
    this.transporterArr.push(transporter);
  });
  }*/

  deleteRow(object){

    const data : Transporter = {
      function: "delete",
      object: "menuitem",
      payload: [
        object.ID as number,
        0
      ]
    }

    //console.log(object.ID);
    this.inventoryService.deleteTransporterPost(data).subscribe();
  }

  restoreRow(object){

    const data : Transporter = {
      function: "delete",
      object: "menuitem",
      payload: [
        object.ID as number,
        1
      ]
    }

    //console.log(object.ID);
    this.inventoryService.deleteTransporterPost(data).subscribe();
  }

  getItems(data: Transporter) {
    //console.log(data);
    this.receiver$ = this.inventoryService.getTransporterPost(data);
   }

   retrieveMenu(transporter: Transporter){
    console.log(transporter);
    this.receiver$ = this.inventoryService.getTransporterPost(transporter);
  }

}

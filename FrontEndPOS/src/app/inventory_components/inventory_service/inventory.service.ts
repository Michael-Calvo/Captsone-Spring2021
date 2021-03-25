import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { InventoryClass } from './inventory-class';

const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json'
  })
}

@Injectable({
  providedIn: 'root'
})
export class InventoryService {

  constructor(private http:HttpClient) { }

  public getdata(): Observable<InventoryClass[]> {
    return this.http.get<InventoryClass[]>('https://jsonplaceholder.typicode.com/users');
  }
}

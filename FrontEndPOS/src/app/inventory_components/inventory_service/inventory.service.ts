import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams, HttpResponse } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Transporter } from './transporter';
import { MenuItem2 } from './menu-item2';
import { map } from 'rxjs/operators';
import { catchError } from 'rxjs/operators';
import { retry } from "rxjs/operators";
import { AppSettings } from '../../app.setting';
import { Receiver } from './receiver';

const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'POST'
  })
}

@Injectable({
  providedIn: 'root'
})
export class InventoryService {


  baseUrl = "https://jsonplaceholder.typicode.com";

  constructor(private http:HttpClient) { }

  public createTransporterPost(transporter:Transporter ): Observable<Transporter> {
    console.log(transporter);
    return this.http.post<Transporter>("http://localhost/POSAPI/", transporter, httpOptions)
  }

  public getTransporterPost(transporter:Transporter): Observable<Receiver> {
    return this.http.post<Receiver>("http://localhost/POSAPI/", transporter, httpOptions)
  }

  public deleteTransporterPost(transporter:Transporter): Observable<Transporter> {
    return this.http.post<Transporter>("http://localhost/POSAPI/", transporter, httpOptions)
  }
  
}

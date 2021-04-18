import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams, HttpResponse } from '@angular/common/http';
import { Observable } from 'rxjs';
import { MenuItem } from './menu-item';
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


  public getdata(): Observable<MenuItem []> {
    let params = new HttpParams().set('userId', "1");
    //let headers = new HttpHeaders().set("Authroization", "auth-token");
    return this.http.get<MenuItem[]>(`${this.baseUrl}/users`)
  }

  public getTransporterdata(): Observable<Transporter [] > {
    let params = new HttpParams().set('userId', "1");
    //let headers = new HttpHeaders().set("Authroization", "auth-token");
    return this.http.get<Transporter[]>(`${AppSettings.BASE_URL}`)
  }

  public createPost(inventoryClass:MenuItem ): Observable<MenuItem> {
    return this.http.post<MenuItem>("PLACEHOLDER", inventoryClass, httpOptions).pipe(
        //.catchError(err => {
          //console.log(err)
          //eturn Observable.of(err)
          // })
    )
  }

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

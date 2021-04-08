import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { ClockIn } from './clock-in';
import { Transporter } from './transporter';
import { map } from 'rxjs/operators';
import { catchError } from 'rxjs/operators';
import { retry } from "rxjs/operators";
import { AppSettings } from '../../app.setting';

const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json'
  })
}

@Injectable({
  providedIn: 'root'
})
export class SchedulingService {


  baseUrl = "https://jsonplaceholder.typicode.com";

  constructor(private http:HttpClient) { }


  public getdata(): Observable<ClockIn []> {
    let params = new HttpParams().set('userId', "1");
    //let headers = new HttpHeaders().set("Authroization", "auth-token");
    return this.http.get<ClockIn[]>(`${this.baseUrl}/users`)
  }

  public getTransporterdata(): Observable<Transporter [] > {
    let params = new HttpParams().set('userId', "1");
    //let headers = new HttpHeaders().set("Authroization", "auth-token");
    return this.http.get<Transporter[]>(`${AppSettings.BASE_URL}/users`)
  }

  public createPost(inventoryClass:ClockIn ): Observable<ClockIn> {
    return this.http.post<ClockIn>("PLACEHOLDER", inventoryClass, httpOptions).pipe(
        //.catchError(err => {
          //console.log(err)
          //eturn Observable.of(err)
          // })
    )
  }

  public createTransporterPost(transporter:Transporter ): Observable<Transporter> {
    return this.http.post<Transporter>("api", transporter, httpOptions).pipe(
        //.catchError(err => {
          //console.log(err)
          //eturn Observable.of(err)
          // })
    )
  }
}

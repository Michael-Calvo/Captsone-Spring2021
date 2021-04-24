import { Injectable } from '@angular/core';
import { Transporter } from './transporter';
import { Receiver } from './receiver';
import { HttpClient, HttpHeaders, HttpParams, HttpResponse } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ApiCallerServiceService {

  private apiURL = "http://localhost/POSAPI/";
  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'POST'
    })
  }
  constructor(private http:HttpClient) { }

  public getTransporterPost(transporter:Transporter): Observable<Receiver> {
    return this.http.post<Receiver>(this.apiURL, transporter, this.httpOptions)
  }
}

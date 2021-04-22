import { Injectable } from '@angular/core';
import { Transporter } from './transporter';
import { Receiver } from './receiver';
import { HttpClient, HttpHeaders, HttpParams, HttpResponse } from '@angular/common/http';
import { Observable } from 'rxjs';
import{DBUser} from './user';
import { AppSettings } from '../../app.setting';


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

export class LandingPage_Service {
  baseUrl = "https://jsonplaceholder.typicode.com";

  constructor(private http:HttpClient) { }


  public getdata(): Observable<DBUser []> {
    let params = new HttpParams().set('userId', "1");
    //let headers = new HttpHeaders().set("Authroization", "auth-token");
    return this.http.get<DBUser[]>(`${this.baseUrl}/users`)
  }

  public getTransporterdata(): Observable<Transporter [] > {
    let params = new HttpParams().set('userId', "1");
    //let headers = new HttpHeaders().set("Authroization", "auth-token");
    return this.http.get<Transporter[]>(`${AppSettings.BASE_URL}`)
  }

  public createPost(userClass:DBUser ): Observable<DBUser> {
    return this.http.post<DBUser>("PLACEHOLDER", userClass, httpOptions).pipe(
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


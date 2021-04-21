
import { variable } from '@angular/compiler/src/output/output_ast';
import { Component, OnInit, EventEmitter, Output, Input } from '@angular/core';
import {AuthService} from "../../auth_service/auth.service";
import {Transporter} from "../../landingPage_service/transporter";
import {Receiver} from "../../landingPage_service/receiver";
import {LandingPage_Service} from "../../landingPage_service/landing-page-service.service"
import { Observable } from 'rxjs';
import { DBUser } from '../../landingPage_service/user/user';
import { Injectable} from '@angular/core';


@Injectable({
    providedIn: 'root'
  })
export class UserDB implements OnInit {
    @Output() findUser:EventEmitter<Transporter> = new EventEmitter<Transporter>();
   
    public receiver$: Observable<Receiver>;
    user1;
    user2;
    userName;
  
    constructor(public authService: AuthService, public landingPage_service: LandingPage_Service) { }
  
    ngOnInit(): void {
      this.user2 = this.authService.getUserData();
      this.userName = this.user2.userName;
     this.user1= this.userSeek(this.userName);
    }
  
    userSeek(userName) {
      const Userdata:Transporter = {
        function: "read",
        object: "userlu",
        payload: [
          userName
        ]
      }
     return this.retrieveUser(Userdata);
    }
  
    retrieveUser(userData: Transporter){
      console.log(userData);
      this.receiver$ = this.landingPage_service.getTransporterPost(userData);
      this.receiver$.subscribe(res =>{
        console.log(res);
        this.user1 = res.Objects[0];
        });
        return this.user1
    }
    
    getUserData(){
        return this.user1;
    }
  }
  
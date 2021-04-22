import { variable } from '@angular/compiler/src/output/output_ast';
import { Component, OnInit, EventEmitter, Output, OnDestroy} from '@angular/core';
import {AuthService} from "../../auth_service/auth.service";
import {Transporter} from "../landingPage_service/transporter";
import {Receiver} from "../landingPage_service/receiver";
import {LandingPage_Service} from "../landingPage_service/landing-page-service.service"
import { Observable } from 'rxjs';
import { __assign } from 'tslib';
import {userService} from '../../user.service'

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss']
})
export class ProfileComponent implements OnInit {
  @Output() findUser:EventEmitter<Transporter> = new EventEmitter<Transporter>();
 
  public receiver$: Observable<Receiver>;
  firebaseUser;
  firebaseUserName;
  UserName;
  userData;
  userServiceData;
  userSub;
  userPersist;
  userHolder;


  constructor(public authService: AuthService, 
    public landingPage_service: LandingPage_Service, 
    public userService:userService) {
   }

  ngOnInit(): void {
    console.log(this.userPersist)
    this.firebaseUser =  JSON.parse(localStorage.getItem('user'));
    this.firebaseUserName =  JSON.parse(localStorage.getItem('userName'));
    this.UserName = this.firebaseUserName.UserName;
    this.userPersist =  JSON.parse(localStorage.getItem('userData'))
    }
    


  userSeek(userName) {
    const Userdata:Transporter = {
      function: "read",
      object: "userlu",
      payload: [
        userName
      ]
    }
    this.retrieveUser(Userdata);
  }

  retrieveUser(userData: Transporter){
    console.log(userData);
    this.receiver$ = this.landingPage_service.getTransporterPost(userData);
    this.receiver$.subscribe(res =>{
      console.log(res);
      this.userHolder =res.Objects[0];
      this.userService.setUserData(res.Objects[0]);

    });
  }

}


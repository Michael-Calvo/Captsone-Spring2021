import { variable } from '@angular/compiler/src/output/output_ast';
import { Component, OnInit, EventEmitter, Output, Input } from '@angular/core';
import {AuthService} from "../auth_service/auth.service";
import {Transporter} from "../landingPage_service/transporter";
import {Receiver} from "../landingPage_service/receiver";
import {LandingPage_Service} from "../landingPage_service/landing-page-service.service"
import { Observable } from 'rxjs';
import { DBUser } from '../landingPage_service/user/user';
import { AngularFirestore, AngularFirestoreDocument } from '@angular/fire/firestore';
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
  user1;
  user2;
  user3;
  userName;
  userData;
  userReturn;
  userTest;
  userSub;

  constructor(public afs: AngularFirestore, public authService: AuthService, public landingPage_service: LandingPage_Service) { }

  ngOnInit(): void {
    this.user2 = this.authService.getUserData();
    this.userName = this.user2.userName;
    this.userSeek(this.userName);
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
      this.user1 = res.Objects[0];
      localStorage.setItem('userDB', JSON.stringify(this.user1));
      this.userReturn = JSON.parse(localStorage.getItem('userDB'));
      this.userData =this.setUserData(this.user1);
      });
    
  }

setUserData(user){
  const userData: DBUser = new DBUser(user.ID, user.UserName,user.FirstName,user.LastName,user.RoleID,user.IsActive,user.SortValue)

  return userData;
}
getUserData(){
  return this.userData;
}

}


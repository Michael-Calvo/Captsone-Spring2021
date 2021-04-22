import { Injectable, NgZone } from '@angular/core';
import {FireBaseUser} from '../landingPage_components/landingPage_service/user';
import {User2} from '../landingPage_components/landingPage_service/user';
import {Router} from "@angular/router";
import {AngularFireAuth} from "@angular/fire/auth";
import firebase from "firebase/app";
import { AngularFirestore, AngularFirestoreDocument } from '@angular/fire/firestore';
import { Observable } from 'rxjs';
import {userService} from "../user.service";
import {LandingPage_Service} from "../landingPage_components/landingPage_service/landing-page-service.service"
import {Transporter} from "../landingPage_components/landingPage_service/transporter";
import {Receiver} from "../landingPage_components/landingPage_service/receiver";
@Injectable({
  providedIn: 'root'
})

export class AuthService {
  userData: any;
  userData2: any;
 
  public receiver$: Observable<Receiver>;

  constructor(
    public afs: AngularFirestore,
    public router: Router,
    public ngZone: NgZone,
    public afAuth: AngularFireAuth,
    private angularFireAuth: AngularFireAuth,
    public userService: userService,
    public landingPage_service: LandingPage_Service
  ) { 
    this.afAuth.authState.subscribe(user => {
      if (user) {
        this.userData = user;
        localStorage.setItem('user', JSON.stringify(this.userData));
        JSON.parse(localStorage.getItem('user'));
      } else {
        localStorage.setItem('user', null);
        JSON.parse(localStorage.getItem('user'));
      }
    })
  }

  OAuthProvider(provider){
    return this.afAuth.signInWithPopup(provider).then((res) =>{
      this.SetUserDataFirebase(res.user);
      this.userData2 = this.setUserData(res.user); 
      this.userSeek(this.userData2.UserName);
      this.ngZone.run(()=> {
        setTimeout(() => {
          this.router.navigate(['profile']);
          }, 50);
        });
 
    }).catch((error)=>{
      window.alert(error)
    })

  }

  SigninWithGoogle(){
    return this.OAuthProvider(new firebase.auth.GoogleAuthProvider()).then(res => {
        console.log('Successfully logged in!')
    }).catch(error => {
        console.log(error)
    });
  }

  SignOut() {  
    return this.afAuth.signOut().then(() => {
      localStorage.removeItem('user');
      localStorage.removeItem('userName');
      localStorage.removeItem('userData');

      this.router.navigate(['welcome-page']).then(
        ()=>{window.location.reload();
        });
    })
    
  }

  SetUserDataFirebase(user){
    const userRef: AngularFirestoreDocument<any> = this.afs.doc(`users/${user.uid}`);
    const userData: FireBaseUser = {
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoURL: user.photoURL,
      emailVerified: user.emailVerified,
    }

    return userRef.set(userData, {
      merge: true
    })
  }

  setUserData(user){
    var email = user.email;
    var emailsplit = email.split("@",1);
    const userData2: User2 = new User2(emailsplit[0]);
    localStorage.setItem('userName', JSON.stringify(userData2));
    JSON.parse(localStorage.getItem('userName'));
    return userData2
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
      this.userService.setUserData(res.Objects[0]);

    });

  }
}
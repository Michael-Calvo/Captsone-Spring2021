import { Injectable, NgZone } from '@angular/core';
import {User} from '../profile/user/user';
import {Router} from "@angular/router";
import {AngularFireAuth} from "@angular/fire/auth";
import firebase from "firebase/app";



@Injectable({
  providedIn: 'root'
})
export class AuthService {
  user: User;

  constructor(
    public router: Router,
    public ngZone: NgZone,
    public afAuth: AngularFireAuth,
    private angularFireAuth: AngularFireAuth
  ) { 
    this.afAuth.authState.subscribe(user => {this.user = user;})
  }

  OAuthProvider(provider){
    return this.afAuth.signInWithPopup(provider).then((res) =>{
        this.ngZone.run(()=> {
          this.router.navigate(['profile']);
        })
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

  SignOut(){
    return this.afAuth.signOut().then(() => {
      this.router.navigate(['login']);
  })
  }


  
}

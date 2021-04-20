import { Injectable, NgZone } from '@angular/core';
import {FireBaseUser} from '../landingPage_service/user/user';
import {User2} from '../landingPage_service/user/user';
import {Router} from "@angular/router";
import {AngularFireAuth} from "@angular/fire/auth";
import firebase from "firebase/app";
import { AngularFirestore, AngularFirestoreDocument } from '@angular/fire/firestore';


@Injectable({
  providedIn: 'root'
})

export class AuthService {
  userData: any;
  userData2: any;
  constructor(
    public afs: AngularFirestore,
    public router: Router,
    public ngZone: NgZone,
    public afAuth: AngularFireAuth,
    private angularFireAuth: AngularFireAuth
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
        this.ngZone.run(()=> {
          this.router.navigate(['profile']);
        });
        this.SetUserDataFirebase(res.user);
        this.userData2 = this.setUserData(res.user);
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
    const userData2: User2 = new User2(emailsplit[0],10,"Roletest");
    return userData2
  }

  getUserData(){
    return this.userData2;
  }

  getUserFireBaseData(){
    return this.userData;
  }

  
}

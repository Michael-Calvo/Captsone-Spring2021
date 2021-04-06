import { Injectable, NgZone } from '@angular/core';
import {User} from '../profile/user/user';
import {Router} from "@angular/router";
import {AngularFireAuth} from "@angular/fire/auth";
import firebase from "firebase/app";
import { AngularFirestore, AngularFirestoreDocument } from '@angular/fire/firestore';


@Injectable({
  providedIn: 'root'
})
export class AuthService {
  user: User;

  constructor(
    public afs: AngularFirestore,
    public router: Router,
    public ngZone: NgZone,
    public afAuth: AngularFireAuth,
    private angularFireAuth: AngularFireAuth
  ) { 
    this.afAuth.authState.subscribe(user => { if (user) {
      this.user = user;
      localStorage.setItem('user', JSON.stringify(this.user));
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
        })
        this.SetUserData(res.user);
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
      this.router.navigate(['profile']);
    })
  }

  SetUserData(user){
    const userRef: AngularFirestoreDocument<any> = this.afs.doc(`users/${user.uid}`);
    const userData: User = {
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoURL: user.photoURL,
      emailVerified: user.emailVerified
    }
    return userRef.set(userData, {
      merge: true
    })
  }


  
}

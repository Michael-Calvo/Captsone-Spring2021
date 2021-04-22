import {Injectable} from '@angular/core';
import { Subject} from 'rxjs';
@Injectable({
    providedIn: 'root'
  })
export class userService{
    public userSource$ = new Subject();
    userReturn = this.userSource$.asObservable();
    localStorage: Storage;
    userLocal;
    constructor(){
        this.localStorage = window.localStorage;
    }
    
    setUserData(user){
        this.userSource$.next(user);
        this.userLocal = user;
        if(!this.localStorage.getItem('userData')){
            this.localStorage.setItem('userData', JSON.stringify(this.userLocal));
            JSON.parse(localStorage.getItem('userData')); 
        }
    }

    getUserData(){
        return JSON.parse(this.localStorage.getItem('userData'))
    }

    removeUser(){
        this.localStorage.removeItem('user');
    }


}
  
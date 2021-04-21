import {Injectable} from '@angular/core';
import { BehaviorSubject} from 'rxjs';
import { DBUser } from './landingPage_components/landingPage_service/user/user';

@Injectable()
export class userService{
    DefaultUser = new DBUser(0,'UserName','FirstName','LastName',0,0,0);
    private userSource = new BehaviorSubject(this.DefaultUser);
    user4 = this.userSource.asObservable();
    constructor(){}

    
    setUserData(user){
      const userData: DBUser = new DBUser(user.ID, user.UserName,user.FirstName,user.LastName,user.RoleID,user.IsActive,user.SortValue)
      this.userSource.next(userData);
      return userData;
    }



}
  
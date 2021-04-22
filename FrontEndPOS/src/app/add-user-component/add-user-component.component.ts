import { Component, OnInit } from '@angular/core';
import {AuthService} from "../auth_service/auth.service";
import {DBUserForm_ADD} from "../landingPage_components/landingPage_service/user"
import {Transporter} from "../landingPage_components/landingPage_service/transporter";
import {LandingPage_Service} from "../landingPage_components/landingPage_service/landing-page-service.service"

@Component({
  selector: 'app-add-user-component',
  templateUrl: './add-user-component.component.html',
  styleUrls: ['./add-user-component.component.scss']
})
export class AddUserComponentComponent implements OnInit {

  addUser: DBUserForm_ADD = new DBUserForm_ADD();
  UserName;
  FirstName;
  LastName;
  RoleID;
  constructor(public authService: AuthService, public landingPageService: LandingPage_Service) { }

  ngOnInit(): void {
  }

  
  addUserFun(){
    const transporter:Transporter = {
      function: "create",
      object: "userlu",
      payload: [
        this.UserName,
        this.FirstName,
        this.LastName,
        this.RoleID,
        1,
        1,
      ]
    }
    this.landingPageService.createTransporterPost(transporter).subscribe();
  }
}

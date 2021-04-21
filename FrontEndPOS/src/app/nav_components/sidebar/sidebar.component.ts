import { Component, OnInit } from '@angular/core';
import {AuthService} from "../../landingPage_components/auth_service/auth.service";
import {userService} from "../../user.service";
@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.scss']
})
export class SidebarComponent implements OnInit {
  userSub;
  userTest;
  userChanges$ = this.userService.userSource$;

  constructor( public authService: AuthService,public userService:userService  ) { }
  ngOnInit(): void {
    this.userTest = JSON.parse(localStorage.getItem('userData'))
  }



}

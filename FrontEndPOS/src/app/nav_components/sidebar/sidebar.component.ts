import { Component, OnInit } from '@angular/core';
import {AuthService} from "../../auth_service/auth.service";

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.scss']
})
export class SidebarComponent implements OnInit {
  user1;

  constructor( public authService: AuthService) { }

  ngOnInit(): void {
    this.user1 = this.authService.getUserData();

  }



}

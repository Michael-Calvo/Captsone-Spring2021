import { variable } from '@angular/compiler/src/output/output_ast';
import { Component, OnInit } from '@angular/core';
import {AuthService} from "../auth_service/auth.service";


@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss']
})
export class ProfileComponent implements OnInit {
  user1;
  user2;

  constructor(public authService: AuthService) { }

  ngOnInit(): void {
    this.user2 = this.authService.getUserData();
  }

}

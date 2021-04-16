import { Component, OnInit } from '@angular/core';
import { formatDate } from '@angular/common';

@Component({
  selector: 'app-scheduling-page',
  templateUrl: './scheduling-page.component.html',
  styleUrls: ['./scheduling-page.component.scss']
})
export class SchedulingComponent implements OnInit {
  
  msg:string;
  time = new Date();
  currentTime = '';
  constructor() {
    
   }
   ClockIn() {
     alert(this.currentTime);
     return this.currentTime;
   }
   ClockOut(){
     alert(this.currentTime);
     return this.currentTime;
    }
   ViewSchedule(){
     
   }

  ngOnInit()  {
    setInterval(() => {
      this.time = new Date();
      this.currentTime = formatDate(this.time, 'MM-dd-yyyy hh:mm:ss', 'en-US');
    }, 1000);
  }
 
  
}

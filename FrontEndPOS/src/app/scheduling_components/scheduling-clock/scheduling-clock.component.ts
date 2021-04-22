import { Component, OnInit } from '@angular/core';
import { formatDate } from '@angular/common';
@Component({
  selector: 'app-scheduling-clock',
  templateUrl: './scheduling-clock.component.html',
  styleUrls: ['./scheduling-clock.component.scss']
})
export class SchedulingClockComponent implements OnInit {

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
  ngOnInit() {
setInterval(() => {
      this.time = new Date();
      this.currentTime = formatDate(this.time, 'MM-dd-yyyy hh:mm:ss', 'en-US');
    }, 1000);
  }
   
}

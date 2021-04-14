import { Component, OnInit } from '@angular/core';
import { formatDate } from '@angular/common';
import { ClockIn } from '../scheduling-service/clock-in';

@Component({
  selector: 'app-scheduling-page',
  templateUrl: './scheduling-page.component.html',
  styleUrls: ['./scheduling-page.component.scss']
})
export class SchedulingComponent implements OnInit {
  
  
  time = new Date();
  currentTime = '';
  constructor() {
    
   }
   ClockIn() {
     alert(this.currentTime);
   }
   ClockOut(){
     alert(this.currentTime)
   }

  ngOnInit()  {
    setInterval(() => {
      this.time = new Date();
      this.currentTime = formatDate(this.time, 'MM-dd-yyyy hh:mm:ss', 'en-US');
    }, 1000);
  }
 
  
}

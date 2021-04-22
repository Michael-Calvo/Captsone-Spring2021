import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-view-schedule',
  templateUrl: './view-schedule.component.html',
  styleUrls: ['./view-schedule.component.scss']
})
export class ViewScheduleComponent implements OnInit {

  schedule = 'Employee Schedule';
  scheduleheader = 'Week of April 22, 2021';
  days = ['Jason', 'Mike'];
  constructor() { }

  ngOnInit(): void {
  }

}

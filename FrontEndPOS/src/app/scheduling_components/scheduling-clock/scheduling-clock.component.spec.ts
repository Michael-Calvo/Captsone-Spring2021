import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SchedulingClockComponent } from './scheduling-clock.component';

describe('SchedulingClockComponent', () => {
  let component: SchedulingClockComponent;
  let fixture: ComponentFixture<SchedulingClockComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SchedulingClockComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SchedulingClockComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

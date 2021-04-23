import { ComponentFixture, TestBed } from '@angular/core/testing';

import { APICallerComponent } from './apicaller.component';

describe('APICallerComponent', () => {
  let component: APICallerComponent;
  let fixture: ComponentFixture<APICallerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ APICallerComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(APICallerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

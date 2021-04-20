import { ComponentFixture, TestBed } from '@angular/core/testing';

import { POSTableComponent } from './postable.component';

describe('POSTableComponent', () => {
  let component: POSTableComponent;
  let fixture: ComponentFixture<POSTableComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ POSTableComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(POSTableComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

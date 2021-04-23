import { ComponentFixture, TestBed } from '@angular/core/testing';

import { POSTablesComponent } from './postables.component';

describe('POSTablesComponent', () => {
  let component: POSTablesComponent;
  let fixture: ComponentFixture<POSTablesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ POSTablesComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(POSTablesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

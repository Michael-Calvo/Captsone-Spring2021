import { TestBed } from '@angular/core/testing';

import { LandingPage_Service } from './landing-page-service.service';

describe('LandingPageServiceService', () => {
  let service: LandingPage_Service;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(LandingPage_Service);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});

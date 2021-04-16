import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouterModule} from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { InventoryPageComponent } from './inventory_components/inventory-page/inventory-page.component';
import { InventoryListComponent } from './inventory_components/inventory-list/inventory-list.component';
import { InventoryItemComponent } from './inventory_components/inventory-item/inventory-item.component';
import { TitleComponent } from './landingPage_components/title/title.component';
import { SidebarComponent } from './landingPage_components/sidebar/sidebar.component';
import {ProfileComponent} from './landingPage_components/profile/profile.component';
import {AngularFireModule} from "@angular/fire";
import {AngularFireAuthModule} from "@angular/fire/auth";
import {environment} from "../environments/environment";
import { WelcomePageComponent } from './landingPage_components/welcome-page/welcome-page.component';
import { SchedulingClockComponent } from './scheduling_components/scheduling-clock/scheduling-clock.component';
import { ViewScheduleComponent } from './scheduling_components/view-schedule/view-schedule.component';

@NgModule({
  declarations: [
    AppComponent,
    InventoryPageComponent,
    InventoryListComponent,
    InventoryItemComponent,
    TitleComponent,
    ProfileComponent,
    SidebarComponent,
    WelcomePageComponent,
    SchedulingClockComponent,
    ViewScheduleComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    RouterModule,
    AngularFireAuthModule,
    AngularFireModule.initializeApp(environment.firebase)
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';


import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavTestComponent } from './landing_page_components/nav-test/nav-test.component';
import { ProfileComponent } from './landing_page_components/profile/profile.component';
import { TitleComponentComponent } from './landing_page_components/title-component/title-component.component';
import { InventoryPageComponent } from './inventory_components/inventory-page/inventory-page.component';
import { InventoryListComponent } from './inventory_components/inventory-list/inventory-list.component';


@NgModule({
  declarations: [
    AppComponent,
    NavTestComponent,
    ProfileComponent,
    TitleComponentComponent,
    InventoryPageComponent,
    InventoryListComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

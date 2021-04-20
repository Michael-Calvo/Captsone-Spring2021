import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouterModule} from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { InventoryPageComponent } from './inventory_components/inventory-page/inventory-page.component';
import { InventoryListComponent } from './inventory_components/inventory-list/inventory-list.component';
import { TitleComponent } from './landingPage_components/title/title.component';
import { SidebarComponent } from './landingPage_components/sidebar/sidebar.component';
import {ProfileComponent} from './landingPage_components/profile/profile.component';
import {AngularFireModule} from "@angular/fire";
import {AngularFireAuthModule} from "@angular/fire/auth";
import {environment} from "../environments/environment";
import { WelcomePageComponent } from './landingPage_components/welcome-page/welcome-page.component';
import { AddInventoryItemComponent } from './inventory_components/add-inventory-item/add-inventory-item.component';
import { MenuSearchComponent } from './inventory_components/menu-search/menu-search.component';
import { StoreComponent } from './store/store.component';
import { POSTableComponent } from "./store/postable/postable.component";

@NgModule({
  declarations: [
    AppComponent,
    InventoryPageComponent,
    InventoryListComponent,
    TitleComponent,
    ProfileComponent,
    SidebarComponent,
    WelcomePageComponent,
    AddInventoryItemComponent,
    MenuSearchComponent,
    StoreComponent,
    POSTableComponent,
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

import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { InventoryPageComponent } from './inventory_components/inventory-page/inventory-page.component';
import { InventoryListComponent } from './inventory_components/inventory-list/inventory-list.component';
import { TitleComponent } from './landing_components/title/title.component';
import { SidebarComponent } from './landing_components/sidebar/sidebar.component';
import { ProfileComponent } from './landing_components/profile/profile.component';


@NgModule({
  declarations: [
    AppComponent,
    InventoryPageComponent,
    InventoryListComponent,
    TitleComponent,
    SidebarComponent,
    ProfileComponent
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

import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { InventoryPageComponent } from './inventory_components/inventory-page/inventory-page.component';
import {ProfileComponent} from './landingPage_components/profile/profile.component';
import {WelcomePageComponent} from './landingPage_components/welcome-page/welcome-page.component';
import {AddInventoryItemComponent} from './inventory_components/add-inventory-item/add-inventory-item.component';
import { StoreComponent } from "./store/store.component";
const routes: Routes = [
  {path: '',component: WelcomePageComponent},
  {path: 'welcome-page',component: WelcomePageComponent},
  {path: 'inventory',component: InventoryPageComponent},
  {path: 'profile', component: ProfileComponent},
  {path: 'add-item', component: AddInventoryItemComponent},
  {path: 'Store', component: StoreComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes, {onSameUrlNavigation: 'reload'})],
  exports: [RouterModule]
})
export class AppRoutingModule { }

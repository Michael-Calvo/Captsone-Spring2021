import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { InventoryPageComponent } from './inventory_components/inventory-page/inventory-page.component';
import { InventoryListComponent} from './inventory_components/inventory-list/inventory-list.component';
import {ProfileComponent} from './landingPage_components/profile/profile.component';
import {WelcomePageComponent} from './landingPage_components/welcome-page/welcome-page.component';
import {AddInventoryItemComponent} from './inventory_components/add-inventory-item/add-inventory-item.component';
import { StoreComponent } from "./store/store.component";
import {AddUserComponentComponent} from './add-user-component/add-user-component.component';
const routes: Routes = [
  {path: '',component: WelcomePageComponent},
  {path: 'welcome-page',component: WelcomePageComponent},
  {path: 'inventory',component: InventoryListComponent},
  {path: 'profile', component: ProfileComponent},
  {path: 'add-item', component: AddInventoryItemComponent},
  {path: 'store', component: StoreComponent},
  {path: 'add-user',component:AddUserComponentComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

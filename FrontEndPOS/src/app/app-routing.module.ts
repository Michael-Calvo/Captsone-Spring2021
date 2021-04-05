import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { InventoryPageComponent } from './inventory_components/inventory-page/inventory-page.component';
import {ProfileComponent} from './landingPage_components/profile/profile.component';
const routes: Routes = [
  {path: '',component: ProfileComponent},
  {path: 'inventory',component: InventoryPageComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

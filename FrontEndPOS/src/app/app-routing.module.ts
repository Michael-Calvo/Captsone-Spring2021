import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { InventoryPageComponent } from './inventory_components/inventory-page/inventory-page.component';
import {ProfileComponent} from './landingPage_components/profile/profile.component';
import {WelcomePageComponent} from './landingPage_components/welcome-page/welcome-page.component';
const routes: Routes = [
  {path: '',component: WelcomePageComponent},
  {path: 'welcome-page',component: WelcomePageComponent},
  {path: 'inventory',component: InventoryPageComponent},
  {path: 'profile', component: ProfileComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

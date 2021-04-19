import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { InventoryPageComponent } from './inventory_components/inventory-page/inventory-page.component';
import {ProfileComponent} from './landingPage_components/profile/profile.component';
import {WelcomePageComponent} from './landingPage_components/welcome-page/welcome-page.component';
import {SchedulingComponent} from './scheduling_components/scheduling-page/scheduling-page.component';
import {ViewScheduleComponent} from './scheduling_components/view-schedule/view-schedule.component';
import {AddInventoryItemComponent} from './inventory_components/add-inventory-item/add-inventory-item.component';
const routes: Routes = [
  {path: '',component: WelcomePageComponent},
  {path: 'welcome-page',component: WelcomePageComponent},
  {path: 'inventory',component: InventoryPageComponent},
  {path: 'profile', component: ProfileComponent},
  {path: 'scheduling', component: SchedulingComponent},
  {path: 'view-schedule', component: ViewScheduleComponent},
  {path: 'add-item', component: AddInventoryItemComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

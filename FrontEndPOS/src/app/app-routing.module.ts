import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ProfileComponent } from './landing_components/profile/profile.component';
import { SidebarComponent } from './landing_components/sidebar/sidebar.component';
import { InventoryPageComponent } from './inventory_components/inventory-page/inventory-page.component';

const routes: Routes = [
  {path: '',component: ProfileComponent},
  {path: 'inventory',component: InventoryPageComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

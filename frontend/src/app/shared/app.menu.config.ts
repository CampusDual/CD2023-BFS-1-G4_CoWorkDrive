import { MenuRootItem } from 'ontimize-web-ngx';

export const MENU_CONFIG: MenuRootItem[] = [
  { id: 'home', name: 'HOME', icon: 'home', route: '/main/home' },
  { id: 'cars', name: 'CARS', route: '/main/car', icon: 'directions_car', confirm: 'yes' },
  { id: 'trips', name: 'TRIPS', route: '/main/trip', icon: 'navigation', confirm: 'yes' },
  { id: 'logout', name: 'LOGOUT', route: '/login', icon: 'power_settings_new', confirm: 'yes' }
];

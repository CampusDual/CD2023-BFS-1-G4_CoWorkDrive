import { MenuRootItem } from 'ontimize-web-ngx';

export const MENU_CONFIG: MenuRootItem[] = [
  { id: 'home', name: 'BOOKINGS', icon: 'home', route: '/main/home' },
  { id: 'car', name: 'CARS', route: '/main/car', icon: 'directions_car', confirm: 'yes' },
  { id: 'trip', name: 'MY TRIPS', route: '/main/trip', icon: 'navigation', confirm: 'yes' },
  { id: 'booking', name: 'MY BOOKINGS', route: '/main/booking', icon: 'booking', confirm: 'yes' },
  { id: 'logout', name: 'LOGOUT', route: '/login', icon: 'power_settings_new', confirm: 'yes' }
];

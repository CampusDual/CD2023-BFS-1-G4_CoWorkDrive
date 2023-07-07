import { MenuRootItem } from 'ontimize-web-ngx';

export const MENU_CONFIG: MenuRootItem[] = [
  { id: 'home', name: 'BOOKINGS', icon: 'home', route: '/main/home' },
  { id: 'car', name: 'CARS', route: '/main/car', icon: 'directions_car', confirm: 'yes' },
  { id: 'trip', name: 'MY TRIPS', icon: 'navigation', opened: true, 
    items: [
      { id: 'tripsToDo', name: 'SCHEDULED', tooltip: 'SCHEDULED', route: '/main/trip/scheduled', icon: 'schedule' },
      { id: 'tripsDone', name: 'DONE', tooltip: 'DONE', route: '/main/trip/done', icon: 'done' } 
  ]
  },
  { id: 'booking', name: 'MY BOOKINGS', icon: 'booking', opened: true,
    items: [
      { id: 'bookingsToDo', name: 'SCHEDULED', tooltip: 'SCHEDULED', route: '/main/booking/scheduled', icon: 'schedule' },
      { id: 'bookingsDone', name: 'DONE', tooltip: 'DONE', route: '/main/booking/done', icon: 'done' } 
  ]},
  { id: 'notification', name: 'NOTIFICATIONS', route: '/main/notification', icon: 'notifications_active', confirm: 'yes' },
  { id: 'logout', name: 'LOGOUT', route: '/login', icon: 'power_settings_new', confirm: 'yes' }
];

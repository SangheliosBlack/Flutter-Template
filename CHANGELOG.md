## Changelog

### [00011] - [13/MAY/2025] - JULIO VILLAGRANA

- Added FCM configuration and permissions in AndroidManifest.xml
- Implemented NotificationService for handling FCM token and permissions
- Created NotificationPermission screen for user notification permissions
- Updated AuthRepository to include FCM token management
- Refactored user loading and updating logic to accommodate FCM token
- Added Firebase options for web, Android, and iOS platforms
- Updated environment variables for Firebase configuration
- Enhanced routing to include NotificationPermission screen
- Updated changelog to reflect new features and changes

### [00010] - [11/MAY/2025] - JULIO VILLAGRANA
- Refactor refresh and keep data local user

### [00009] - [17/ABR/2025] - JULIO VILLAGRANA
- Add clients feature

### [00008] - [23/ENE/2025] - Julio Villagrana
- Add admin feature

### [00007] -  [19/ENE/2025] - Julio Vilagrana 
- Add sales and datatable service

### [00006] -  [25/DIC/2024] - Julio Villagrana
- Add Point of Sale template UI and routes

### [00005] -  [23/DIC/2024] - Julio Villagrana
- Refactor to Clean Architecture
- Change state manager from BLoC to Riverpod notation
- Add Dependency Injection

### [00004] -  [06/OCT/2024] - Julio Villagrana
- Fixed package name both platforms

### [00003] -  [01/OCT/2024] - Julio Villagrana
- Test Firebase App Distribution

### [00002] - [29/SEP/2024] - .@Julio Villagrana
- Add Firebase App Distribution github action
- Enabled gradle configuration for flavors and build types renames

### [00001] - [29/SEP/2024] - @Julio Villagrana

- Migrate to fix Deprecated imperative app
- Flavors, build types and env folder added for Android builds

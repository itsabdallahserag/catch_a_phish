# catch_a_phish

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
## 1) Splash Screen

Created using Flutter Native Splash.

### Android 12+
- Solid background color
- Centered logo

### Android < 12
<img width="636" height="972" alt="Screenshot 2026-05-21 021508" src="https://github.com/user-attachments/assets/e52d1bc1-bbf6-4fa3-a6db-aa0e0ed3472d" />

## 2) Localization

The application supports multiple languages using Flutter Localization (l10n).

### Features
- Arabic (ar) support
- English (en) support
- Localized UI text
- Easy translation management using ARB files

### Screenshots

| Arabic | English |
|---------|---------|
<img width="532" height="973" alt="Screenshot 2026-05-21 185431" src="https://github.com/user-attachments/assets/f05d43e4-f5b6-4fad-9868-ba7cf01045e1" />
<img width="512" height="965" alt="Screenshot 2026-05-21 190304" src="https://github.com/user-attachments/assets/5e7d866e-deb2-4a10-a3fe-7f82d5a8e35f" />

## 3) Authentication UI

Complete authentication screen built in Flutter for the CatchAPhish app.

### Features
- Single screen with tab-based switching between Login and Sign Up
- Reusable CustomTextField with border, validation, and error styling
- Gradient ACCESS SECURE TERMINAL action button
- Social login buttons (Google, GitHub)
- Remember me checkbox and Forgot Password link (Login)
- Confirm password field with match validation (Sign Up)
- Background image with transparent card overlay

### Structure
ui/auth/

├── auth_screen.dart               ( Root screen )

├── custom_widgets/

│   ├── auth_action_button.dart    # Gradient CTA button

│   ├── auth_social_widget.dart    # Google & GitHub buttons

│   └── custom_text_field.dart     # Reusable input field

└── reusable_widgets/

    ├── container_auth.dart        # Tab state management
    
    └── container_auth_widgets/
    
        ├── tab_content/
        
        │   ├── auth_tab.dart
        
        │   └── container_auth_tab.dart
        
        └── form_login_or_signup/
        
            ├── login_form.dart
            
            └── signup_form.dart
<img width="498" height="802" alt="Screenshot 2026-05-23 180744" src="https://github.com/user-attachments/assets/de08e970-2baa-40f2-aad3-26cbea09fc8d" />
<img width="497" height="824" alt="Screenshot 2026-05-23 180804" src="https://github.com/user-attachments/assets/2b4c3ee1-b83f-4ebd-a19a-a4d0b9f42621" /> 


## 4) Authentication

Implemented Firebase Authentication to provide secure and seamless user access.

### Features
- Sign Up with Email & Password
- Login with Email & Password
- Google Sign-In Integration
- GitHub Sign-In Integration
- Form Validation for Authentication Fields
- Authentication Error Handling
- Persistent User Sessions
- Secure Authentication Flow Using Firebase Auth

### Screenshot
<img width="518" height="880" alt="image" src="https://github.com/user-attachments/assets/6624bcc4-2de1-4525-93d4-b1d144c4019f" />

## 5) Home Screen
Built the home screen with a bottom navigation bar containing 4 tabs:
- Home
- History  
- Profile
- Settings
<img width="562" height="973" alt="Screenshot 2026-05-26 220111" src="https://github.com/user-attachments/assets/a9803e0f-6919-45b1-8cae-4d4869dcb5db" />
<img width="558" height="965" alt="Screenshot 2026-05-26 220056" src="https://github.com/user-attachments/assets/1f4211f6-2afb-44d6-b70c-c0f8e49aebea" />

## 6) Home Screen

The home tab is built from four stateless widget components:

- **TacticalOverView** — shows daily scan and threat counts
- **Engaged** — displays real-time System Shield status  
- **MessageScan** — entry point for analyzing text/email payloads
- **UrlScan** — entry point for checking URLs before clicking

All theming is centralized in `AppColors`, `AppStyles`, and `AppImages`.
### Screenshot
<img width="538" height="961" alt="image" src="https://github.com/user-attachments/assets/df6dfc09-dbbb-4b84-bb22-13cd15102f12" />



## 7) feat(auth):
integrate Flutter Toast and Dialog Utils into authentication flow

- Added reusable Dialog Utils for alerts, confirmations, and loading states
- Integrated Flutter Toast for success and error notifications
- Applied toast and dialog handling across authentication screens
- Improved user feedback and overall authentication UX
- screenshoots
<img width="481" height="921" alt="Screenshot 2026-06-04 040040" src="https://github.com/user-attachments/assets/a0e9b479-5727-4614-82d0-045cb25615f6" />
<img width="442" height="909" alt="Screenshot 2026-06-04 035958" src="https://github.com/user-attachments/assets/cd597270-ed3f-4b82-845f-ec0778594f6d" />
<img width="505" height="924" alt="Screenshot 2026-06-04 035942" src="https://github.com/user-attachments/assets/51b4abc7-e054-4f88-a08a-008dd2c9492f" />

## 8) PhishX Branding
- Updated the application name to **PhishX**.
- Added a custom launcher icon for Android and iOS.

### Message Analysis API Integration
- Added API constants and endpoints configuration.
- Implemented API manager for handling phishing message analysis requests.
- Created response models for parsing API results.

### Enhanced Message Scanning
- Integrated real-time message analysis functionality.
- Added loading state handling during API requests.
- Implemented error handling for failed requests.
- Displayed threat analysis results dynamically after scanning.

### Improved User Experience
- Added smooth result animations using `animate_do`.
- Enhanced UI responsiveness and scan workflow.
- Prevented duplicate requests while analysis is in progress.

### Dependencies Added
- `animate_do` for UI animations.
- `flutter_launcher_icons` for custom application icons.
<img width="546" height="1000" alt="Screenshot 2026-06-05 170827" src="https://github.com/user-attachments/assets/25113c3f-b73b-4c04-af71-2ee12c84e4ba" />
<img width="554" height="964" alt="Screenshot 2026-06-05 165310" src="https://github.com/user-attachments/assets/f9a95486-5dac-403e-830b-1a27ad9abe6f" />

## 9) URL Scan Improvements
Description

This update enhances the URL Scan feature by improving input validation, API error handling, and screenshot rendering to provide a smoother and more reliable user experience.

Changes
Validates URLs to ensure they use HTTP/HTTPS and contain a valid host.
Automatically dismisses the keyboard before starting the scan.
Clears previous scan results before performing a new scan.
Displays API error messages (detail) using a SnackBar.
Adds mounted checks before updating the UI after asynchronous operations.
Improves exception handling with debugPrint for easier debugging.
Requests a screenshot only when a valid screenshotScanId is available.
Displays the screenshot only when its status is ready and a valid image URL exists.
Uses CachedNetworkImage with loading and error placeholders for better image handling.
Ensures the loading indicator is stopped correctly in every execution path.
Screenshot

<img width="400" height="848" alt="Screenshot 2026-06-08 053218" src="https://github.com/user-attachments/assets/415add8b-700f-43eb-9103-76813cebb3e9" />

<img width="407" height="847" alt="Screenshot 2026-06-08 053236" src="https://github.com/user-attachments/assets/30cc7994-03f0-40f8-9a0f-e0209739c5f1" />









            
  





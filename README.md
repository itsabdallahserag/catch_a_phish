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



            
  





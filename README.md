<p align="center">
  <img src="https://github.com/IkramKhan-DevOps/flutter_boilerplate/blob/main/extras/screens/s1.png" width="200" />
  <img src="https://github.com/IkramKhan-DevOps/flutter_boilerplate/blob/main/extras/screens/s2.png" width="200" />
  <img src="https://github.com/IkramKhan-DevOps/flutter_boilerplate/blob/main/extras/screens/s4.png" width="200" />
 <img src="https://github.com/IkramKhan-DevOps/flutter_boilerplate/blob/main/extras/screens/s7.png" width="200" />
</p>


# Flutter Boilerplate
Welcome to my Flutter Boilerplate – a feature-rich, reusable starting point for building
professional-grade Flutter applications. This boilerplate is designed to save developers time by
providing pre-built screens, essential features, reusable widgets, and configurations commonly
required in modern mobile apps. Whether you're building a small prototype or a large-scale
production app, this boilerplate has you covered.


## Table of Contents
1. Screens
2. Features
3. Widgets
4. Setup Instructions
5. Usage Examples
6. Contributing
7. License


## Screens
The boilerplate includes a variety of pre-designed screens to jumpstart your app development:

 - **Splash**: A polished splash screen to greet users while the app initializes.
 - **Onboarding**: A multi-step onboarding flow for first-time users.
 - **Login**: A secure login screen with input validation.
 - **Signup**: A user registration screen with necessary fields.
 - **Password Reset**: A screen for resetting forgotten passwords.
 - **Home**: The main landing screen after login.
 - **Dashboard**: A customizable dashboard for key app data or metrics.
 - **Settings**: A settings screen for app preferences.
 - **Profile Change**: A screen to update user profile details.
 - **Password Change**: A dedicated screen for updating passwords.
 - **Web View for Links**: A web view screen to display external URLs within the app.

## Features
The boilerplate comes with a range of features to help you build a robust Flutter app:

### Theme Management
1. Supports both dark and light themes out of the box.
2. Easily switch themes with a single configuration.

### Networking
-   Pre-configured **network layer** to handle API requests using Dio or http.
-   Built-in support for API endpoints and web links.

### App Configurations
-   Centralized **app configurations** for easy customization (e.g., API base URL, app name).
-   **App constants** and **color constants** for consistency.

### Routing
-   **App routes** pre-defined for seamless navigation.

### Assets Management
-   Pre-configured **image routes**, **Lottie animations**, and **fonts**.
-   Centralized asset constants for easy access.

### Error & Exception Handling
-   Robust **error handling** and **exception handling** to manage crashes gracefully.

### State Management
-   Integrated **state management** (e.g., Provider, Riverpod, or Bloc – specify your choice).
-   Ready for scalable app architecture.

### Local Storage
-   Pre-built **local storage** setup using packages like shared_preferences or hive.

### Authentication
-   **Auth token setup** for secure API communication.

## Widgets

A collection of reusable, customizable widgets to speed up UI development:

-   **Buttons**: Pre-styled buttons (e.g., primary, secondary, outlined).
-   **Text Fields**: Custom text fields with validation and styling
-   **App Bars**: Flexible app bars for consistent navigation.
-   **Footers**: Reusable footer widgets for layouts.
-   **Dividers**: Styled dividers for section separation.
-   **Bottom Sheets**: Pre-built bottom sheets for dialogs or options.
-   **Toast & Popups**: Snackbars and popups for user feedback.
- **Web View Widgets**: Embedded web views for displaying links.

## Setup Instructions

1.  **Clone the Repository**
    `git clone https://github.com/yourusername/flutter-boilerplate.git cd flutter-boilerplate`
    
2.  **Install Dependencies**
    `flutter pub get`
    
3.  **Configure the App**
    -   Update lib/config/app_config.dart with your API base URL and other settings.
    -   Add your assets (images, Lottie files, fonts) to the assets/ directory and update pubspec.yaml.
4.  **Run the App** 
    `flutter run`

## Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request with improvements or bug fixes.

1.  Fork the repository.
2.  Create a new branch (git checkout -b feature/your-feature).
3.  Commit your changes (git commit -m "Add your feature").
4.  Push to the branch (git push origin feature/your-feature).
5.  Open a pull request.

## License

This project is licensed under the MIT License – see the [LICENSE](LICENSE) file for details.

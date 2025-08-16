# Flutter

A modern Flutter-based mobile application utilizing the latest mobile development technologies and tools for building responsive cross-platform applications.

## 📋 Prerequisites

- Flutter SDK (^3.29.2)
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- Android SDK / Xcode (for iOS development)

## 🛠️ Installation

1. Install dependencies:
```bash
flutter pub get
```

2. Run the application:

To run the app with environment variables defined in an env.json file, follow the steps mentioned below:
1. Through CLI
    ```bash
    flutter run --dart-define-from-file=env.json
    ```
2. For VSCode
    - Open .vscode/launch.json (create it if it doesn't exist).
    - Add or modify your launch configuration to include --dart-define-from-file:
    ```json
    {
        "version": "0.2.0",
        "configurations": [
            {
                "name": "Launch",
                "request": "launch",
                "type": "dart",
                "program": "lib/main.dart",
                "args": [
                    "--dart-define-from-file",
                    "env.json"
                ]
            }
        ]
    }
    ```
3. For IntelliJ / Android Studio
    - Go to Run > Edit Configurations.
    - Select your Flutter configuration or create a new one.
    - Add the following to the "Additional arguments" field:
    ```bash
    --dart-define-from-file=env.json
    ```

## 📁 Project Structure

```
flutter_app/
├── android/            # Android-specific configuration
├── ios/                # iOS-specific configuration
├── lib/
│   ├── core/           # Core utilities and services
│   │   └── utils/      # Utility classes
│   ├── presentation/   # UI screens and widgets
│   │   └── splash_screen/ # Splash screen implementation
│   ├── routes/         # Application routing
│   ├── theme/          # Theme configuration
│   ├── widgets/        # Reusable UI components
│   └── main.dart       # Application entry point
├── assets/             # Static assets (images, fonts, etc.)
├── pubspec.yaml        # Project dependencies and configuration
└── README.md           # Project documentation
```

## 🧩 Adding Routes

To add new routes to the application, update the `lib/routes/app_routes.dart` file:

```dart
import 'package:flutter/material.dart';
import 'package:package_name/presentation/home_screen/home_screen.dart';

class AppRoutes {
  static const String initial = '/';
  static const String home = '/home';

  static Map<String, WidgetBuilder> routes = {
    initial: (context) => const SplashScreen(),
    home: (context) => const HomeScreen(),
    // Add more routes as needed
  }
}
```

## 🎨 Theming

This project includes a comprehensive theming system with both light and dark themes:

```dart
// Access the current theme
ThemeData theme = Theme.of(context);

// Use theme colors
Color primaryColor = theme.colorScheme.primary;
```

The theme configuration includes:
- Color schemes for light and dark modes
- Typography styles
- Button themes
- Input decoration themes
- Card and dialog themes

## 📱 Responsive Design

The app is built with responsive design using the Sizer package:

```dart
// Example of responsive sizing
Container(
  width: 50.w, // 50% of screen width
  height: 20.h, // 20% of screen height
  child: Text('Responsive Container'),
)
```
## 📦 Deployment

Build the application for production:

```bash
# For Android
flutter build apk --release

# For iOS
flutter build ios --release
```

## 🙏 Acknowledgments
- Built with [Rocket.new](https://rocket.new)
- Powered by [Flutter](https://flutter.dev) & [Dart](https://dart.dev)
- Styled with Material Design

Built with ❤️ on Rocket.new

## 🖼️ Visual Comparison & Captures

- Open the side-by-side visual comparison: `assets/comparison.html` (screenshots and videos for YAZIO vs NutriTracker).
- Automated capture scripts are under `scripts/` (ADB driven):
  - `scripts/flows_nutritracker.py`, `scripts/flows_yazio.py` capture key flows (diary/search/detail/settings/analytics).
  - `scripts/capture_modes.py` toggles dark mode and font scale for accessibility captures.

Quick ADB tips (emulator):
```bash
# List devices
adb devices -l

# Screenshot
adb exec-out screencap -p > screenshot.png

# Short screen recording (10s)
adb shell screenrecord --time-limit 10 /sdcard/demo.mp4
adb pull /sdcard/demo.mp4 .
```

## 🎯 Goals Wizard

- Configure daily goals via the in-app wizard: route `AppRoutes.goalsWizard` or Profile → "Configurar metas".
- Goals are persisted in `UserPreferences` and per‑meal goals are derived to feed diary progress bars.

## 📓 Changelog

- See `CHANGELOG.md` for release notes (current: 1.1.0).

## 🧪 Build & Install (ADB)

- Script: `scripts/build_install.sh`
  - Debug: `bash scripts/build_install.sh`
  - Release: `bash scripts/build_install.sh --release`
  - Target a device: `ADB_SERIAL=emulator-5554 bash scripts/build_install.sh`

- Makefile (optional):
```bash
# Build and install (debug)
make build-and-install

# Analyze
make analyze

# With specific device
make build-and-install ADB_SERIAL=emulator-5554
```

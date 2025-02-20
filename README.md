# Flutter Template Minimum

This project is a Flutter template that provides a foundational structure for building Flutter applications. It includes a set of essential libraries for localization, state management (using Riverpod), network requests (using Dio), permissions handling, UI elements (like splash screens and image caching), and more. The template supports both development and production environments with flavor-based builds, and integrates tools for code generation, testing, and serialization. It's designed to be easily extended and customized for a variety of use cases.
## Features
- **Localization** using `intl` and `intl_utils`
- **State Management** with `flutter_riverpod`
- **Network Requests** using `dio`
- **Permissions Handling** with `permission_handler`
- **Image Caching** with `cached_network_image`
- **UI Elements** like native splash screens and launcher icons
- **Code Generation** using `freezed` and `json_serializable`
- **Flavor-Based Builds** for different environments (development and production)

## Getting Started

### 1. Install FVM
Install [FVM](https://fvm.app/documentation/getting-started/installation).

### 2. Clone the Project
Clone the repository to your local machine.

### 3. Install Flutter
Run the following command to install Flutter using FVM:

```bash
fvm install
```

### 4. Install dependencies
Install project dependencies by running:

```bash
fvm flutter pub get
```

### 5. Generate Localization Files
Generate the necessary localization files with:

```bash
fvm dart run intl_utils:generate
```

### 6. Run Code Generation
Run code generation for Freezed and other builders using:

```bash
fvm dart run build_runner build --delete-conflicting-outputs
```

### 7. Run App in Dev Flavor
To run the app in the dev flavor, execute:

```bash
fvm flutter run --flavor dev -t lib/main_dev.dart -d <device_id>
```

### 8. Run App in Prod Flavor
To run the app in the prod flavor, execute:

```bash
fvm flutter run --flavor prod -t lib/main_prod.dart -d <device_id>
```

### 9. Build APK for Prod
To build an APK for the prod flavor, run:

```bash
fvm flutter build apk --flavor prod --target lib/main_prod.dart --release
```

### 10. Build iOS for Prod
To build the iOS version for the prod flavor, run:

```bash
fvm flutter build ios --flavor prod --target lib/main_prod.dart --release
```

## Run app in Android Studio
To run the app in Android Studio, follow these steps:

1. Complete the first 6 commands in “**Getting Started.**”
2. Open Android Studio and navigate to **Settings** -> **Language & Framework** -> **Dart**.
3. Enable Dart support and set the Dart SDK path to: /.fvm/versions/3.29.0/bin/cache/dart-sdk
4. Check **Enable Dart support for the following modules**.
5. Click **Apply** and **OK**.
6. Click **Run** or use **^R** to run the app.

## Additional Commands

### Generate intl Files
```bash
fvm dart run intl_utils:generate
```

### Run Code Generation for Freezed and Other Builders
```bash
fvm dart run build_runner build --delete-conflicting-outputs
```

### Troubleshooting
If you encounter issues, try the following:
```bash
fvm flutter clean
fvm flutter pub get
fvm dart run intl_utils:generate
fvm dart run build_runner build
```

### Update flavor
To update your app’s flavor configuration, run:
```bash
fvm dart run flutter_flavorizr
```

### Update launcher icon
```bash update launcher icon
fvm dart run flutter_launcher_icons
```

### Create native splash
```bash
fvm dart run flutter_native_splash:create
```

### Use Firebase

Follow the instructions in this [article](https://codewithandrea.com/articles/flutter-firebase-multiple-flavors-flutterfire-cli/) to configure Firebase for different flavors in Flutter.
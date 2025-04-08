# Manapipes Flutter App

A comprehensive mobile application for hookah/shisha enthusiasts to track sessions, manage gear, find places, and create tobacco mixtures.

![Manapipes Logo](assets/mana_logo_black.png)

## Features

- **Smoke Session Tracking**: Create and manage your hookah sessions with detailed information
- **Places Map**: Find hookah lounges and cafes near you
- **Mixology**: Create, save, and share your favorite tobacco mixtures
- **Gear Management**: Keep track of your hookah equipment (hookahs, bowls, heat management systems, coals, etc.)
- **Statistics**: View detailed statistics about your smoking habits and sessions
- **Social Features**: Share sessions and mixtures with friends
- **Multi-language Support**: Available in English, Czech, and German

## Installation

### Prerequisites

- Flutter SDK (>=2.12.0 <3.2.0)
- Dart SDK
- Android Studio / Xcode (for mobile deployment)
- Firebase account (for authentication and other Firebase services)
- Google Maps API key

### Setup

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/manapipesFlutter.git
   cd manapipesFlutter
   ```

2. Install dependencies:
   ```
   flutter pub get
   ```

3. Configure Firebase:
   - Create a Firebase project
   - Add Android and iOS apps to your Firebase project
   - Download and place the configuration files:
     - `google-services.json` in `android/app/`
     - `GoogleService-Info.plist` in `ios/Runner/`

4. Configure Google Maps:
   - Get a Google Maps API key
   - Add it to the appropriate files:
     - For Android: `android/app/src/main/AndroidManifest.xml`
     - For iOS: `ios/Runner/AppDelegate.swift`

5. Run the app:
   ```
   flutter run
   ```

## API Generation

The app uses OpenAPI for API client generation. To regenerate the API client:

1. Update the Swagger definition in `/swagger/swagger.json`
2. Run the generator:
   ```
   openapi-generator generate -i swagger/swagger.json -g dart -DbrowserClient=false -o ./openapi
   ```

## Project Structure

- `lib/`: Main source code
  - `app/`: Application setup and configuration
  - `components/`: Reusable UI components
  - `const/`: Constants used throughout the app
  - `Helpers/`: Helper classes and utility functions
  - `models/`: Data models
  - `module/`: Business logic modules
  - `pages/`: UI screens
  - `routes/`: Navigation routes
  - `services/`: Services for API communication, authentication, etc.
  - `theme/`: App theming
  - `utils/`: Utility functions and classes
- `assets/`: Static assets (images, fonts, etc.)
- `fonts/`: Custom fonts
- `locale/`: Localization files
- `openapi/`: Generated API client
- `swagger/`: OpenAPI/Swagger definition files

## Development Environments

The app supports multiple environments:

- **Development**: `lib/dev.dart`
- **Production**: `lib/prod.dart`
- **Local**: `lib/local.dart`
- **Web Local**: `lib/weblocal.dart`

## Technologies Used

- **Flutter**: Cross-platform UI framework
- **Firebase**: Authentication, messaging, dynamic links
- **Google Maps**: Location and mapping services
- **Hive**: Local database storage
- **Dio**: HTTP client
- **GetIt**: Dependency injection
- **Provider**: State management
- **Fluro**: Routing
- **RxDart**: Reactive programming
- **OpenAPI Generator**: API client generation

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the [MIT License](LICENSE) - see the LICENSE file for details.

## Acknowledgements

- [Flutter](https://flutter.dev/)
- [Firebase](https://firebase.google.com/)
- [Google Maps](https://developers.google.com/maps)
- All the contributors who have helped shape Manapipes

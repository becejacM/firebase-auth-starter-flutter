# firebase-auth-flutter
# Flutter Firebase Authentication Project

This Flutter project demonstrates how to implement Firebase Authentication with user login, registration, and logout functionalities. Additionally, the project saves and retrieves user details such as first name, last name, and company name.

## Features

- User Registration with email, password, first name, last name, and company name
- User Login with email and password
- Logout functionality
- Displays user information on the home screen

## Requirements

- Flutter SDK
- Firebase account
- Xcode (for iOS development)
- Android Studio (for Android development)

## Technologies Used

- **auto_route** for navigation
- **bloc** pattern for state management
- **injectable** and **get_it** for dependency injection

## Project Structure

The project is structured to include a `BaseScreen` and a `BaseBloc` to manage common UI states such as loading. This ensures a consistent user experience across different screens.

### `BaseScreen`

The `BaseScreen` widget is a reusable component that provides a consistent structure for all screens. It includes:

- Common margins and padding
- A loading spinner displayed during asynchronous operations
- A footer displaying the text "Milana"

### `BaseBloc`

The `BaseBloc` handles common application states, specifically loading states, and is used across the application to manage loading indicators consistently.

### Usage

To get started with the project, follow these steps:

1. **Clone the repository**
   ```sh
   git clone https://github.com/becejacM/firebase-auth-starter-flutter.git
   cd firebase-auth-flutter
2. Run `flutter pub get` to install dependencies
3. Configure your Firebase project and add the `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS)
4. Run the project on your desired device or emulator

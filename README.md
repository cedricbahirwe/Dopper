# DoperApp

DoperApp is a simple SwiftUI application designed to demonstrate user authentication, state management, and modular code organization. The project features a clean architecture with separate folders for Models, Services, Utilities, and ViewModels, making it easy to maintain and extend.

## Features

- **Login Screen**: Secure user authentication interface.
- **User Information View**: Displays user details after login.
- **State Management**: Utilizes ViewModels for managing app state and user data.
- **API Service Layer**: Handles API requests and error management.
- **Keychain Integration**: Securely stores user credentials.
- **Constants & Utilities**: Centralized constants and useful extensions for code reusability.

## Project Structure

- `ContentView.swift`, `LoginScreen.swift`, `UserInformationView.swift`: Main SwiftUI views.
- `ViewModels/`: Contains logic for app state and user management.
- `Models/`: Data models and alert types.
- `Service/`: API and Keychain service implementations.
- `Constants/`: App-wide constants.
- `Utilities/`: Extensions and helper functions.

## Getting Started

1. **Clone the repository**
2. **Open the project in Xcode**
3. **Build and run on Simulator or a real device**

## Test Credentials

To log in, use the following credentials:

- **Username:** emilys
- **Password:** emilyspass

## Requirements

- Xcode 13 or later

## Author

Cedric Bahirwe

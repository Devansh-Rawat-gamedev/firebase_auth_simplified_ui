# firebase\_auth\_simplified\_ui

A plug-and-play Flutter package that provides beautiful, customizable Firebase authentication screens (Login, Signup, and Forgot Password) so you can integrate user authentication in just a few lines of code.

![Demo Screenshot](https://raw.githubusercontent.com/yourusername/firebase_auth_simplified_ui/main/example/assets/demo.png)

## 🚀 Features

* **Ready-Made Screens**: Login, Signup, and Forgot Password with modern UI out-of-the-box.
* **Firebase Integration**: Simplifies `firebase_auth` calls under the hood.
* **Customizable Themes**: Override colors, text styles, padding, and logos via `DefaultAuthTheme`.
* **Form Validation**: Built-in email and password validators.
* **Loading & Error States**: Shows progress indicators and user-friendly error messages.
* **Callbacks**: Easy hooks for navigation and handling successful auth flows.

## 📦 Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  firebase_auth_simplified_ui: ^0.1.0
```

Then run:

```bash
dart pub get
```

## 💡 Usage

Wrap your app with the theme (optional) and launch the Login screen:

```dart
import 'package:flutter/material.dart';
import 'package:firebase_auth_simplified_ui/firebase_auth_simplified_ui.dart';

void main() {
  runApp(
    DefaultAuthTheme(
      // Customize theme properties here
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(
        onLoginSuccess: (user) {
          // Navigate to home
        },
        onRegisterTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => SignupScreen(onSignupSuccess: (user) {/*...*/})),
          );
        },
        onForgotPasswordTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ForgotPasswordScreen()),
          );
        },
      ),
    );
  }
}
```

## 🛠️ Customization

Use `DefaultAuthTheme` to override:

```dart
DefaultAuthTheme(
  backgroundColor: Colors.grey.shade100,
  inputDecoration: InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
  ),
  primaryButtonStyle: ButtonStyle(
    backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
  ),
  logo: Image.asset('assets/logo.png', height: 100),
  child: MyApp(),
)
```

## 🎓 Example App

Check the `example/` folder for a complete demo showcasing:

* Screen navigation flow
* Theme overrides
* Handling success and error callbacks

## 📖 Documentation & Support

* **API Reference**: [pub.dev Documentation](https://pub.dev/packages/firebase_auth_simplified_ui)
* **Source Code**: [GitHub Repository](https://github.com/yourusername/firebase_auth_simplified_ui)
* **Issues & Feature Requests**: Open an issue on GitHub.

## ❤️ Contributing

1. Fork the repo
2. Create a new branch: `git checkout -b feature/YourFeature`
3. Commit your changes: \`git commit -m 'Add YourFeature'
4. Push to the branch: `git push origin feature/YourFeature`
5. Open a Pull Request

## 📜 License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

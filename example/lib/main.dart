import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth_simplified_ui/firebase_auth_simplified_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // ✅ This must match
  );
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth UI Example',
      home: FirebaseAuthLoginScreen(
        onLoginSuccess: (user) {
          debugPrint('Login successful: ${user.email}');
        },
        onRegisterTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => FirebaseAuthSignupScreen(
                onSignupSuccess: (_) => Navigator.pop(context),
              ),
            ),
          );
        },
        onForgotPasswordTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => FirebaseAuthForgotPasswordScreen(
                onBackToLogin: () => Navigator.pop(context),
              ),
            ),
          );
        },
      ),
    );
  }
}

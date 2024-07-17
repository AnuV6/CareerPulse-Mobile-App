import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:career_pulse/pages/login.dart';
import 'package:career_pulse/pages/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Career Pulse App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) =>
            const LoginScreen(), // Home route for the Login screen
        '/register': (context) =>
            const RegisterScreen(), // Route for the Register screen
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:career_pulse/pages/login.dart';
import 'package:career_pulse/pages/register.dart';
import 'package:career_pulse/pages/forgot_pw.dart';
import 'package:career_pulse/pages/splash_screen.dart';
import 'package:career_pulse/stuffs/colors.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColors.secondaryColor, 
        appBarTheme: const AppBarTheme(
          color: AppColors.primaryColor, 
          titleTextStyle: TextStyle(
            color: AppColors.titleColor, 
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonColor, 
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>
            const SplashScreen(), // Home route for the splash screen
        '/login': (context) =>
            const LoginScreen(), // Home route for the Login screen
        '/register': (context) =>
            const RegisterScreen(), // Route for the Register screen
        '/forgotPassword': (context) =>
            const ForgotPasswordScreen(), // Route for the forgot password screen
      },
    );
  }
}

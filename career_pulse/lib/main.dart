import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:career_pulse/pages/login.dart';
//import 'package:career_pulse/pages/register.dart';
import 'package:career_pulse/pages/splash_screen.dart';
import 'package:career_pulse/stuf/colors.dart';

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
      home: SplashScreen(),
    );
  }
}

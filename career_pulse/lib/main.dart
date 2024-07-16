import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:career_pulse/pages/splash1.dart'; // Import your splash1.dart page here

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Career Pulse Anupa case',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green, // Set your primary color
      ),
      home: const Splash1(), // Set your initial screen here
    );
  }
}

import 'package:career_pulse/pages/login.dart';
//import ur page here

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  runApp(const MainApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Creer Pulse App',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(), 
    );
  }
}


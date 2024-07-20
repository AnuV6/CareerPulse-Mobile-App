
import 'package:career_pulse/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class AuthenticationService{
  //signup action
  Future<void> signup({
    required BuildContext context, // Add BuildContext parameter
    required String email, 
    required String password
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, 
        password: password,
      );

      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ), 
      );

    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message ='The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message ='The account already exists for that email.';
      }
        
        Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
        );

    } catch (e) {
  // ignore: avoid_print
      print(e);
    }
  
  }
//login action
  Future<void> login({
    required BuildContext context, // Add BuildContext parameter
    required String email, 
    required String password
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, 
        password: password,
      );

      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ), 
      );

    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'user-not-found') {
        message ='No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message ='Wrong password provided for that user.';
      }
        
        Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
        );

    } catch (e) {
}
  }
//forgot password action
  Future<void> forgotPassword({
    required BuildContext context, // Add BuildContext parameter
    required String email,
  }) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );

      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ), 
      );

    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.message == 'user-not-found') {
        message ='No user found for that email.';
      }
        
        Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
        );

    } catch (e) {
  // ignore: avoid_print
      print(e);
    }
  }
//signout action
  Future<void> signout({
    required BuildContext context, // Add BuildContext parameter
  }) async {
    try {
      await FirebaseAuth.instance.signOut();

      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ), 
      );

    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'user-not-found') {
        message ='No user found for that email.';
      }
        
        Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
        );

    } catch (e) {
  // ignore: avoid_print
      print(e);
    }
  }

}
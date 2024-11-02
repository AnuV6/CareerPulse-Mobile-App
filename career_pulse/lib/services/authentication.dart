import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:career_pulse/pages/interested_area_screen.dart';

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Signup with email and password
  Future<void> signup({
    required String fullname,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // Create user with Firebase Authentication
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store user data (full name and email) in Firestore collection
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'fullName': fullname,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });

      // Navigate to InterestedAreaScreen after successful signup
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const InterestedAreaScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      } else {
        message = 'An error occurred. Please try again.';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }

  /// Signup with Google account
  Future<void> signUpWithGoogle({required BuildContext context}) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final OAuthCredential googleCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Google and save additional data in Firestore if the user is new
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(googleCredential);
      if (userCredential.additionalUserInfo?.isNewUser ?? false) {
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'fullName': googleUser.displayName,
          'email': googleUser.email,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      // Navigate to InterestedAreaScreen after successful Google signup
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const InterestedAreaScreen()),
        );
      }
    }
  }

  /// Signin with email and password
  Future<void> signin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save the remember me state to SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('rememberMe', true);

      // Navigate to the home page after successful sign-in
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, '/homePage');
      }
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = 'An error occurred. Please try again.';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }

  /// Signin with Google account
  Future<void> signInWithGoogle({required BuildContext context}) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final OAuthCredential googleCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Google and save additional data in Firestore if the user is new
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(googleCredential);
      if (userCredential.additionalUserInfo?.isNewUser ?? false) {
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'fullName': googleUser.displayName,
          'email': googleUser.email,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      // Navigate to InterestedAreaScreen after successful Google sign-in if the user is new
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const InterestedAreaScreen()),
        );
      }
    }
  }

  /// Send password reset email
  Future<void> resetPassword({required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  /// Sign out the user
  Future<void> signout({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut();

    // Navigate back to the login screen after sign-out
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }
}

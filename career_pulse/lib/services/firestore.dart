// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserData(
      String userId, String name, String email, String photoUrl) async {
    try {
      await _db.collection('users').doc(userId).set({
        'name': name,
        'email': email,
        'photoUrl': photoUrl,
        'createdAt': FieldValue.serverTimestamp(),
      });
      print("User data saved successfully.");
    } catch (e) {
      print("Error saving user data: $e");
    }
  }
}

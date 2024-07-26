import 'package:flutter/material.dart';

class SavedInternshipsState with ChangeNotifier {
  final List<Map<String, String>> _savedInternships = [];

  List<Map<String, String>> get savedInternships => _savedInternships;

  void addSavedInternship(Map<String, String> internship) {
    if (!_isInternshipSaved(internship)) {
      _savedInternships.add(internship);
      notifyListeners();
    }
  }

  void removeSavedInternship(Map<String, String> internship) {
    _savedInternships.removeWhere((element) =>
        element['title'] == internship['title'] &&
        element['company'] == internship['company'] &&
        element['role'] == internship['role']);
    notifyListeners();
  }

  bool _isInternshipSaved(Map<String, String> internship) {
    return _savedInternships.any((element) =>
        element['title'] == internship['title'] &&
        element['company'] == internship['company'] &&
        element['role'] == internship['role']);
  }

  bool isInternshipSaved(Map<String, String> internship) {
    return _isInternshipSaved(internship);
  }
}

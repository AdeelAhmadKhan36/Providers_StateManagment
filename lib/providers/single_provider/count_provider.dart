import 'package:flutter/material.dart';

class CountProvider with ChangeNotifier {
  int _count = 0;
  String _message = "Hello";

  int get count => _count;
  String get message => _message;

  void incrementCount() {
    _count++;
    notifyListeners(); // Notifies listeners about the change
  }

  void updateMessage() {
    _message = "Updated Message!";
    notifyListeners(); // Notifies listeners about the change
  }
}

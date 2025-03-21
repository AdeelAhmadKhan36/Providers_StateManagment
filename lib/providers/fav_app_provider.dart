import 'package:flutter/material.dart';


class FavProvider with ChangeNotifier {
  final List<int> _selectedItem = [];

  List<int> get selectedItem => List.unmodifiable(_selectedItem);

  void toggleItem(int value) {
    if (_selectedItem.contains(value)) {
      _selectedItem.remove(value); // Remove if already selected
    } else {
      _selectedItem.add(value); // Add if not selected
    }
    notifyListeners();
  }
}

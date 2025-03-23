
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class ThemeChanger extends ChangeNotifier{
  var _thememode=ThemeMode.light;

  ThemeMode get themeMode => _thememode;

  void settheme(themeMode) {
    _thememode = themeMode;
    notifyListeners();
  }

}
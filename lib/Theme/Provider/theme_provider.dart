import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  var _themeState = ThemeMode
      .light; // initially i have set it light you can set it dark as well
  ThemeMode get themeState => _themeState;

  void setTheme() {
    final isLight = _themeState == ThemeMode.dark;
    if (isLight) {
      _themeState = ThemeMode.light;
    } else {
      _themeState = ThemeMode.dark;
    }
    notifyListeners();
  }
}

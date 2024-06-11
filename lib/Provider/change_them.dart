import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  var _themeState = ThemeMode.light;
  ThemeMode get themeState => _themeState;

  void setTheme() {
    final isDark = _themeState == ThemeMode.dark; // Correct comparison
    if (isDark) {
      _themeState = ThemeMode.light; // Correct assignment
    } else {
      _themeState = ThemeMode.dark; // Correct assignment
    }
    notifyListeners();
  }
}

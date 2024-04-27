import 'package:flutter/material.dart';

class ThemeService extends ChangeNotifier {
  bool isDarkModeOn = true;
  void toggleTheme() {
    this.isDarkModeOn = !this.isDarkModeOn;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/ui/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  var currentTheme = CustomTheme.darkMode;
  void changeTheme() {
    if (currentTheme == CustomTheme.darkMode) {
      currentTheme = CustomTheme.ligthMode;
    } else {
      currentTheme = CustomTheme.darkMode;
    }
    notifyListeners();
  }
}

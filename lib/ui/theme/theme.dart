import 'package:flutter/material.dart';

abstract final class CustomTheme {
  static final ThemeData ligthMode = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    colorScheme: const ColorScheme.light(
        background: Color.fromRGBO(245, 245, 245, 1),
        primary: Colors.white,
        primaryContainer: Colors.white),
  );
  static final ThemeData darkMode = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: Colors.black,
      primary: Color.fromRGBO(32, 32, 32, 1),
      primaryContainer: Color.fromRGBO(32, 32, 32, 1),
    ),
  );
}

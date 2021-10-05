import 'package:flutter/material.dart';

class CustomTheme {
  static final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.blue,
    ),
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
  );

  static final darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.deepPurple,
    ),
    brightness: Brightness.dark,
    primarySwatch: Colors.deepPurple,
  );
}

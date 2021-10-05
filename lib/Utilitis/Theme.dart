import 'package:flutter/material.dart';

class CustomTheme {
  static lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(backgroundColor: Colors.transparent,elevation: 0),
      brightness: Brightness.light,
      primaryColor: Colors.orange[500],
    );
  }

  static darkTheme() {
    return ThemeData(
        scaffoldBackgroundColor: Color(0xff060218),
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(backgroundColor: Colors.transparent,elevation: 0),
        primaryColor: Colors.indigo[900]);
  }
}
Color bgColor= Color(0xff060218);

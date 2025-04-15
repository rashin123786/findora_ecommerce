import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(backgroundColor: Colors.white),
      primaryColor: Color(0XFF26374b),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Color(0XFFf18a37),
      ));
  ThemeData darkTheme = ThemeData.dark();
}

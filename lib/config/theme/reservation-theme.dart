import 'package:flutter/material.dart';

class ReservationTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    textTheme: TextTheme(),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.black,
      disabledColor: Colors.black,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: Colors.white,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.white,
      disabledColor: Colors.white,
    ),
  );
}

import 'package:flutter/material.dart';

ThemeData buildDarkTheme() {
  const Color primaryColor = const Color(0xFF0175c2);
  final ThemeData base = new ThemeData.dark();
  return base.copyWith(
    primaryColor: primaryColor,
    buttonColor: primaryColor,
    indicatorColor: Colors.white,
    accentColor: const Color(0xFF13B9FD),
    canvasColor: const Color(0xFF202124),
    scaffoldBackgroundColor: Colors.black,
    backgroundColor: const Color(0xFF202124),
    errorColor: const Color(0xFFB00020),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: TextTheme(
        headline: TextStyle(fontSize: 42.0, fontWeight: FontWeight.w700),
        title: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w700),
        body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        subtitle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            fontFamily: 'Montserrat'),
        display1: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            fontFamily: 'Montserrat')),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    title: base.title
        .copyWith(fontFamily: 'Montserrat', fontWeight: FontWeight.w700),
  );
}

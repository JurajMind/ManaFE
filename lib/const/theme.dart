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
      headline: TextStyle(
          fontSize: 42.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Montserrat'),
      title: TextStyle(
          fontSize: 36.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Montserrat'),
      body1: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
      subtitle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Montserrat'),
      display1: TextStyle(
          fontSize: 21.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Montserrat'),
      display2: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Montserrat'),
      display3: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Montserrat'),
      display4: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Montserrat'),
    ),
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

class AppColors {
  static const Color scafBg = Colors.black;
  static const Color blue = const Color.fromARGB(0, 31, 3, 255);
  static const Color blueLight = Colors.lightBlue;
  static const Color black = Colors.black;
  static const Color bgBlack = const Color(0xFF202124);
  static const Color white = Colors.white;
  static const Color gray = Colors.grey;
  static const Color green = Colors.green;
  static const List<Color> colors = [
    const Color.fromARGB(255, 31, 3, 255),
    const Color.fromARGB(255, 25, 247, 173),
    const Color.fromARGB(255, 244, 28, 244),
    const Color.fromARGB(255, 242, 160, 29),
  ];
}

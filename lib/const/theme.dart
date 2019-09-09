import 'package:flutter/material.dart';

ThemeData buildDarkTheme() {
  final ThemeData base = new ThemeData.dark();
  return base.copyWith(
    primaryColor: AppColors.colors[1],
    buttonColor: AppColors.colors[1],
    indicatorColor: Colors.white,
    accentColor: AppColors.colors[1],
    canvasColor: const Color(0xFF202124),
    scaffoldBackgroundColor: const Color(0xFF000d1a),
    backgroundColor: const Color(0xFF000d1a),
    errorColor: const Color(0xFFB00020),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    appBarTheme: AppBarTheme(color: AppColors.black),
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
      body2: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Montserrat'),
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
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Montserrat'),
      display4: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Montserrat'),
      caption: TextStyle(fontSize: 12.0, fontFamily: 'Montserrat'),
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

class ThemeConst {
  static const BorderSide oBBorder = BorderSide(color: Colors.white, width: 1);
}

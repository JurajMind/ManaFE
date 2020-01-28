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
      appBarTheme: AppBarTheme(color: AppColors.black),
      colorScheme: ColorScheme.dark(),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
      textTheme: TextTheme(
        headline1: TextStyle(color: AppColors.white, fontSize: 96, fontFamily: 'Montserrat', fontWeight: FontWeight.w300),
        headline2: TextStyle(color: AppColors.white, fontSize: 60, fontFamily: 'Montserrat', fontWeight: FontWeight.w700),
        headline3: TextStyle(color: AppColors.white, fontSize: 48, fontFamily: 'Montserrat', fontWeight: FontWeight.w400),
        headline4: TextStyle(color: AppColors.white, fontSize: 34, fontFamily: 'Montserrat', fontWeight: FontWeight.w400),
        headline5: TextStyle(color: AppColors.white, fontSize: 24, fontFamily: 'Montserrat', fontWeight: FontWeight.w400),
        headline6: TextStyle(color: AppColors.white, fontSize: 20, fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
        subtitle1: TextStyle(color: AppColors.white, fontSize: 16, fontFamily: 'Montserrat'),
        subtitle2: TextStyle(color: AppColors.white, fontSize: 14, fontFamily: 'Montserrat'),
        bodyText1: TextStyle(color: AppColors.white, fontSize: 16, fontFamily: 'Montserrat'),
        bodyText2: TextStyle(color: AppColors.white, fontSize: 14, fontFamily: 'Montserrat'),
        button: TextStyle(color: AppColors.white, fontSize: 14, fontFamily: 'Montserrat'),
        caption: TextStyle(color: AppColors.white, fontSize: 12, fontFamily: 'Montserrat'),
        overline: TextStyle(color: AppColors.white, fontSize: 10, fontFamily: 'Montserrat'),
      ));
}

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    headline6: base.headline6.copyWith(fontFamily: 'Montserrat', fontWeight: FontWeight.w700, color: Colors.white),
  );
}

class AppColors {
  static const Color scafBg = const Color(0xff05233F);
  static const Color blue = const Color.fromARGB(0, 31, 3, 255);
  static const Color blueLight = Colors.lightBlue;
  static const Color black = Colors.black;
  static const Color bgBlack = const Color(0xff05233F);
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

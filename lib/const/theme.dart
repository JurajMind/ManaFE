import 'package:flutter/material.dart';

ThemeData buildDarkTheme() {
  final ThemeData base = ThemeData(fontFamily: 'Montserrat', brightness: Brightness.dark);

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
        headline1: base.textTheme.headline1.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
        headline2: base.textTheme.headline2.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
        headline3: base.textTheme.headline3.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
        headline4: base.textTheme.headline4.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
        headline5: base.textTheme.headline5.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
        headline6: base.textTheme.headline6.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
        subtitle1: base.textTheme.subtitle1.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
        subtitle2: base.textTheme.subtitle2.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
        bodyText1: base.textTheme.bodyText1.copyWith(color: AppColors.white, fontWeight: FontWeight.w500),
        bodyText2: base.textTheme.bodyText2.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
        button: base.textTheme.button.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
        caption: base.textTheme.caption.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
        overline: base.textTheme.overline.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
      ));
}

TextTheme _buildTextTheme(TextTheme base) {
  return base;
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

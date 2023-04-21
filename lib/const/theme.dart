import 'package:flutter/material.dart';

ThemeData buildDarkTheme() {
  final ThemeData base = ThemeData(fontFamily: 'Montserrat', brightness: Brightness.dark);

  return base.copyWith(
      primaryColor: AppColors.colors[1],
      indicatorColor: Colors.white,
      canvasColor: const Color(0xFF202124),
      scaffoldBackgroundColor: const Color(0xFF000d1a),
      appBarTheme: AppBarTheme(color: AppColors.black),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      textTheme: TextTheme(
        displayLarge: base.textTheme.displayLarge!.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
        displayMedium: base.textTheme.displayMedium!.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
        displaySmall: base.textTheme.displaySmall!.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
        headlineMedium: base.textTheme.headlineMedium!.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
        headlineSmall: base.textTheme.headlineSmall!.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
        titleLarge: base.textTheme.titleLarge!.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
        titleMedium: base.textTheme.titleMedium!.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
        titleSmall: base.textTheme.titleSmall!.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
        bodyLarge: base.textTheme.bodyLarge!.copyWith(color: AppColors.white, fontWeight: FontWeight.w500),
        bodyMedium: base.textTheme.bodyMedium!.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
        labelLarge: base.textTheme.labelLarge!.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
        bodySmall: base.textTheme.bodySmall!.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
        labelSmall: base.textTheme.labelSmall!.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
      ), colorScheme: ColorScheme.dark().copyWith(secondary: AppColors.colors[1]).copyWith(background: const Color(0xFF000d1a)).copyWith(error: const Color(0xFFB00020)));
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

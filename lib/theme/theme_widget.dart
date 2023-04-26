import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../const/theme.dart';
import 'theme_data.dart';

class MTheme extends StatelessWidget {
  final MThemeData? themeData;

  static MThemeData of(BuildContext context, {bool listen = true}) {
    return Provider.of(context, listen: listen);
  }

  final Widget child;

  const MTheme({
    Key? key,
    required this.child,
    this.themeData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<MThemeData>(
      create: (context) => this.themeData ?? MThemeData(),
      child: this.child,
    );
  }

  static ThemeData buildDarkTheme(MThemeData theme) {
    final ThemeData base = ThemeData(fontFamily: 'Montserrat', brightness: Brightness.dark);

    return base.copyWith(
        primaryColor: theme.colors[0],
        indicatorColor: Colors.white,
        canvasColor: const Color(0xFF202124),
        scaffoldBackgroundColor: const Color(0xFF000d1a),
        appBarTheme: AppBarTheme(color: theme.black),
        primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
        textTheme: TextTheme(
          displayLarge: base.textTheme.displayLarge!.copyWith(color: theme.white, fontWeight: FontWeight.w700),
          displayMedium: base.textTheme.displayMedium!.copyWith(color: theme.white, fontWeight: FontWeight.w700),
          displaySmall: base.textTheme.displaySmall!.copyWith(color: theme.white, fontWeight: FontWeight.w700),
          headlineMedium: base.textTheme.headlineMedium!.copyWith(color: theme.white, fontWeight: FontWeight.w700),
          headlineSmall: base.textTheme.headlineSmall!.copyWith(color: theme.white, fontWeight: FontWeight.w700),
          titleLarge: base.textTheme.titleLarge!.copyWith(color: theme.white, fontWeight: FontWeight.w700),
          titleMedium: base.textTheme.titleMedium!.copyWith(color: theme.white, fontWeight: FontWeight.w700),
          titleSmall: base.textTheme.titleSmall!.copyWith(color: theme.white, fontWeight: FontWeight.w700),
          bodyLarge: base.textTheme.bodyLarge!.copyWith(color: theme.white, fontWeight: FontWeight.w500),
          bodyMedium: base.textTheme.bodyMedium!.copyWith(color: theme.white, fontWeight: FontWeight.w700),
          labelLarge: base.textTheme.labelLarge!.copyWith(color: theme.white, fontWeight: FontWeight.w700),
          bodySmall: base.textTheme.bodySmall!.copyWith(color: theme.white, fontWeight: FontWeight.w700),
          labelSmall: base.textTheme.labelSmall!.copyWith(color: theme.white, fontWeight: FontWeight.w700),
        ),
        colorScheme: ColorScheme.dark()
            .copyWith(secondary: theme.colors[1])
            .copyWith(background: const Color(0xFF000d1a))
            .copyWith(error: const Color(0xFFB00020)));
  }

  static ThemeData buildFreyaTheme(MThemeData theme) {
    final ThemeData base = ThemeData(fontFamily: 'Roboto', brightness: Brightness.dark);

    return base.copyWith(
        primaryColor: AppColors.freyaRed,
        appBarTheme: AppBarTheme(color: AppColors.freyaBlack),
        indicatorColor: Colors.white,
        canvasColor: AppColors.freyaBlack,
        scaffoldBackgroundColor: AppColors.freyaBlack,
        primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
        colorScheme: ColorScheme.dark()
            .copyWith(secondary: theme.colors[1])
            .copyWith(background: Color(0xFF0e0f12))
            .copyWith(error: const Color(0xFFB00020)));
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    return GoogleFonts.montserratTextTheme(base);
  }
}

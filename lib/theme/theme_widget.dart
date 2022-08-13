import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
  })  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<MThemeData>(
      create: (context) => this.themeData ?? MThemeData(),
      child: this.child,
    );
  }

  static ThemeData buildDarkTheme(MThemeData theme) {
    final ThemeData base =
        ThemeData(fontFamily: 'Montserrat', brightness: Brightness.dark);

    return base.copyWith(
        primaryColor: theme.colors[0],
        indicatorColor: Colors.white,
        canvasColor: const Color(0xFF202124),
        scaffoldBackgroundColor: const Color(0xFF000d1a),
        backgroundColor: const Color(0xFF000d1a),
        errorColor: const Color(0xFFB00020),
        appBarTheme: AppBarTheme(color: theme.black),
        primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
        textTheme: TextTheme(
          headline1: base.textTheme.headline1!
              .copyWith(color: theme.white, fontWeight: FontWeight.w700),
          headline2: base.textTheme.headline2!
              .copyWith(color: theme.white, fontWeight: FontWeight.w700),
          headline3: base.textTheme.headline3!
              .copyWith(color: theme.white, fontWeight: FontWeight.w700),
          headline4: base.textTheme.headline4!
              .copyWith(color: theme.white, fontWeight: FontWeight.w700),
          headline5: base.textTheme.headline5!
              .copyWith(color: theme.white, fontWeight: FontWeight.w700),
          headline6: base.textTheme.headline6!
              .copyWith(color: theme.white, fontWeight: FontWeight.w700),
          subtitle1: base.textTheme.subtitle1!
              .copyWith(color: theme.white, fontWeight: FontWeight.w700),
          subtitle2: base.textTheme.subtitle2!
              .copyWith(color: theme.white, fontWeight: FontWeight.w700),
          bodyText1: base.textTheme.bodyText1!
              .copyWith(color: theme.white, fontWeight: FontWeight.w500),
          bodyText2: base.textTheme.bodyText2!
              .copyWith(color: theme.white, fontWeight: FontWeight.w700),
          button: base.textTheme.button!
              .copyWith(color: theme.white, fontWeight: FontWeight.w700),
          caption: base.textTheme.caption!
              .copyWith(color: theme.white, fontWeight: FontWeight.w700),
          overline: base.textTheme.overline!
              .copyWith(color: theme.white, fontWeight: FontWeight.w700),
        ), colorScheme: ColorScheme.dark().copyWith(secondary: theme.colors[1]));
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    return GoogleFonts.montserratTextTheme(base);
  }
}

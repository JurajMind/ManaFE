import 'package:app/app/app.dart';
import 'package:app/pages/start.page.dart';
import 'package:app/pages/home.page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AppWidgetState();
  }
}

class _AppWidgetState extends State<AppWidget> {

  var userLogin = false;


ThemeData _buildDarkTheme() {
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
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    title: base.title.copyWith(
      fontFamily: 'Montserrat',
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Manapipes',
      home: userLogin?  new HomePage() : new StartPage(),
      onGenerateRoute: App.router.generator,
      theme: this._buildDarkTheme(),
    );
  }
}
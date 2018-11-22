import 'dart:async';

import 'package:app/app/app.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/mixology/mixology_bloc.dart';
import 'package:app/module/places/places_bloc.dart';
import 'package:app/module/smokeSession/preset_bloc.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/start.page.dart';
import 'package:app/pages/home.page.dart';
import 'package:app/utils/translations/app_translations_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:app/utils/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final navigatorKey = new GlobalKey<NavigatorState>();

class AppWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AppWidgetState();
  }

  static restartApp(BuildContext context) {
    final _AppWidgetState state =
        context.ancestorStateOfType(const TypeMatcher<_AppWidgetState>());
    state.restartApp();
  }
}

class _AppWidgetState extends State<AppWidget> {
  Key key = new UniqueKey();
  bool _isAuthorized = false;
  bool splash = true;
  final mixology = MixologyBloc();
  final smokeSession = SmokeSessionBloc();
  final devicePreset = DevicePresetBloc();
  final place = PlacesBloc();
  AppTranslationsDelegate _newLocaleDelegate;

  @override
  void initState() {
    super.initState();
    App.onLocaleChanged = onLocaleChange;
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    isUserAuthorized().then((authorized) => setState(() {
          _isAuthorized = authorized;
          splash = false;
        }));
  }

  void restartApp() {
    this.setState(() {
      key = new UniqueKey();
    });
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new DataProvider(
        mixology: mixology,
        smokeSession: smokeSession,
        devicePreset: devicePreset,
        place: place,
        child: MaterialApp(
          localizationsDelegates: [
            _newLocaleDelegate,
            //provides localised strings
            GlobalMaterialLocalizations.delegate,
            //provides RTL support
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: App.supportedLocales(),
          navigatorKey: navigatorKey,
          title: 'Manapipes',
          home: getMainPage(),
          onGenerateRoute: App.router.generator,
          theme: buildDarkTheme(),
        ));
  }

  Widget getMainPage() {
    if (splash) return new SplashScreen();

    if (_isAuthorized) {
      return new HomePage();
    }

    return new StartPage();
  }

  Future<bool> isUserAuthorized() async {
    final storage = new FlutterSecureStorage();
    String token = await storage.read(key: "accessToken");

    if (token != null) return true;

    return false;
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: new Column(
      children: <Widget>[
        Text('Manapipes'),
        CircularProgressIndicator(),
      ],
    ));
  }
}

import 'dart:async';

import 'package:app/app/app.dart';
import 'package:app/const/theme.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/pages/start.page.dart';
import 'package:app/pages/home.page.dart';
import 'package:app/services/authorization.dart';
import 'package:app/utils/translations/app_translations_delegate.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

final navigatorKey = new GlobalKey<NavigatorState>();

class AppWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AppWidgetState();
  }

  static restartApp(BuildContext context) async {
    final _AppWidgetState state =
        context.ancestorStateOfType(const TypeMatcher<_AppWidgetState>());
    state.restartApp();
  }
}

class _AppWidgetState extends State<AppWidget> {
  Key key = new UniqueKey();
  bool _isAuthorized = false;
  bool splash = true;
  AppTranslationsDelegate _newLocaleDelegate;
  Uri deeplink;

  @override
  void initState() {
    super.initState();
    // initPlatformState();
    initDynamicLinks();
    App.onLocaleChanged = onLocaleChange;
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    isUserAuthorized().then((authorized) => setState(() {
          _isAuthorized = authorized;
          splash = false;
        }));
  }

  void initDynamicLinks() async {
    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri _deepLink = data?.link;

    if (_deepLink != null) {
      deeplink = _deepLink;
    }
    ;
  }

  Future restartApp() async {
    var auth = await isUserAuthorized();
    this.setState(() {
      _isAuthorized = auth;
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

        return MaterialApp(
      key: key,
      localizationsDelegates: [
        _newLocaleDelegate,
        //provides localised strings
        GlobalMaterialLocalizations.delegate,
        //provides RTL support
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: App.supportedLocales(),
      title: 'Manapipes',
      home: _isAuthorized
        ? new DataProvider(key: key, child: getMainPage())
        : getMainPage(),
      // onGenerateRoute: App.router.generator,
      theme: buildDarkTheme(),
    );
    
  }

  Widget getMainPage() {
    if (splash) return new SplashScreen();

    if (_isAuthorized) {
      return new HomePage(deeplink: deeplink);
    }

    return new StartPage();
  }

  Future<bool> isUserAuthorized() async {
    var auth = new Authorize();
    return await auth.isAuthorized();
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: new Column(
      children: <Widget>[
        CircularProgressIndicator(),
      ],
    ));
  }
}

import 'dart:async';

import 'package:alice_lightweight/alice.dart';
import 'package:app/app/app.dart';
import 'package:app/main.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/pages/Start/start.page.dart';
import 'package:app/pages/home.page.dart';
import 'package:app/pages/home.page_freya.dart';
import 'package:app/services/authorization.dart';
import 'package:app/theme/theme_data.dart';
import 'package:app/theme/theme_widget.dart';
import 'package:app/utils/translations/app_translations_delegate.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
//

final navigatorKey = new GlobalKey<NavigatorState>();

class AppWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AppWidgetState();
  }

  static restartApp(BuildContext context) async {
    final AppWidgetState state = context.findAncestorStateOfType<AppWidgetState>()!;
    state.restartApp();
  }
}

class AppWidgetState extends State<AppWidget> {
  var globalNavKey = GlobalKey<NavigatorState>();
  AppTranslationsDelegate? _newLocaleDelegate;
  Uri? deeplink;

  String get title => 'Manapipes';

  ThemeData getTheme(MThemeData theme) {
    return MTheme.buildDarkTheme(theme);
  }

  Widget get startPage => StartPage();

  @override
  void initState() {
    super.initState();
    // initPlatformState();
    initDynamicLinks();
    App.onLocaleChanged = onLocaleChange;
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
  }

  void initDynamicLinks() async {
    final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? _deepLink = data?.link;

    if (_deepLink != null) {
      deeplink = _deepLink;
    }
  }

  Future restartApp() async {
    this.setState(() {
      globalNavKey = GlobalKey<NavigatorState>();
    });
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    var authorized = getIt.get<AuthorizeRepository>().isAuthorized();
    return MTheme(
      child: Builder(builder: (context) {
        var theme = MTheme.of(context);

        // User is not logged
        if (!authorized) {
          return MaterialApp(
            localizationsDelegates: [
              _newLocaleDelegate!,
              //provides localised strings
              GlobalMaterialLocalizations.delegate,
              //provides RTL support
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: App.supportedLocales(),
            title: title,
            home: startPage,
            // onGenerateRoute: App.router.generator,
            theme: getTheme(theme),
          );
        }

        return MaterialApp(
          navigatorKey: getIt.get<Alice>().getNavigatorKey(),
          key: globalNavKey,
          localizationsDelegates: [
            _newLocaleDelegate!,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: App.supportedLocales(),
          title: title,
          navigatorObservers: [routeObserver],

          home: DataProvider(
              child: App.appType == AppType.manapipes
                  ? new HomePage(deeplink: deeplink, routeObserver: routeObserver)
                  : new FreyaHomePage(deeplink: deeplink, routeObserver: routeObserver)),
          // onGenerateRoute: App.router.generator,
          theme: getTheme(theme),
        );
      }),
    );
  }
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

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

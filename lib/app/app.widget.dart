import 'dart:async';

import 'package:app/app/app.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/pages/Start/start.page.dart';
import 'package:app/pages/home.page.dart';
import 'package:app/theme/theme_widget.dart';
import 'package:app/utils/translations/app_translations_delegate.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:app/module/authorization/autorization_store.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

final navigatorKey = new GlobalKey<NavigatorState>();

class AppWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AppWidgetState();
  }

  static restartApp(BuildContext context) async {
    final _AppWidgetState state =
        context.findAncestorStateOfType<_AppWidgetState>();
    state.restartApp();
  }
}

class _AppWidgetState extends State<AppWidget> {
  var globalNavKey = GlobalKey<NavigatorState>();
  AppTranslationsDelegate _newLocaleDelegate;
  Uri deeplink;

  @override
  void initState() {
    super.initState();
    // initPlatformState();
    initDynamicLinks();
    App.onLocaleChanged = onLocaleChange;
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
  }

  void initDynamicLinks() async {
    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri _deepLink = data?.link;

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
    return MTheme(
      child: Provider<AuthorizationStore>(
        create: (BuildContext context) {
          return AuthorizationStore()..getStatus();
        },
        child: Observer(builder: (context) {
          var authStore = Provider.of<AuthorizationStore>(context);
          var theme = MTheme.of(context);
          if (authStore.status == AuthorizationStatus.inProgress) {
            return SplashScreen();
          }

          if (authStore.status == AuthorizationStatus.anonymous) {
            return MaterialApp(
              localizationsDelegates: [
                _newLocaleDelegate,
                //provides localised strings
                GlobalMaterialLocalizations.delegate,
                //provides RTL support
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: App.supportedLocales(),
              title: 'Manapipes',
              home: StartPage(),
              // onGenerateRoute: App.router.generator,
              theme: MTheme.buildDarkTheme(theme),
            );
          }

          return MaterialApp(
            key: globalNavKey,
            localizationsDelegates: [
              _newLocaleDelegate,
              //provides localised strings
              GlobalMaterialLocalizations.delegate,
              //provides RTL support
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: App.supportedLocales(),
            title: 'Manapipes',
            navigatorObservers: [routeObserver],

            home: DataProvider(
                child: new HomePage(
                    deeplink: deeplink, routeObserver: routeObserver)),
            // onGenerateRoute: App.router.generator,
            theme: MTheme.buildDarkTheme(theme),
          );
        }),
      ),
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

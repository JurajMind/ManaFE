import 'dart:async';

import 'package:app/app/app.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/mixology/mixology_bloc.dart';
import 'package:app/module/places/places_bloc.dart';
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
  final place = PlacesBloc();
  AppTranslationsDelegate _newLocaleDelegate;
  String _debugLabelString = "";
  String _emailAddress;
  bool _enableConsentButton = false;
  // CHANGE THIS parameter to true if you want to test GDPR privacy consent
  bool _requireConsent = false;

  @override
  void initState() {
    super.initState();
    // initPlatformState();
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

/*  Future<void> initPlatformState() async {
    if (!mounted) return;

    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setRequiresUserPrivacyConsent(_requireConsent);

    var settings = {
      OSiOSSettings.autoPrompt: false,
      OSiOSSettings.promptBeforeOpeningPushUrl: true
    };

    OneSignal.shared.setNotificationReceivedHandler((notification) {
      this.setState(() {
        _debugLabelString =
            "Received notification: \n${notification.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      this.setState(() {
        _debugLabelString =
            "Opened notification: \n${result.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });

    OneSignal.shared
        .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      print("SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}");
    });

    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
      print("PERMISSION STATE CHANGED: ${changes.jsonRepresentation()}");
    });

    OneSignal.shared.setEmailSubscriptionObserver(
        (OSEmailSubscriptionStateChanges changes) {
      print("EMAIL SUBSCRIPTION STATE CHANGED ${changes.jsonRepresentation()}");
    });

    // NOTE: Replace with your own app ID from https://www.onesignal.com
    await OneSignal.shared
        .init("f3335ca8-8fc9-4e91-b9f8-324717b86d3c", iOSSettings: settings);

    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);

    bool requiresConsent = await OneSignal.shared.requiresUserPrivacyConsent();

    this.setState(() {
      _enableConsentButton = requiresConsent;
    });
  }*/
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

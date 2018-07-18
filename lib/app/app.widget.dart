import 'dart:async';

import 'package:app/app/app.dart';
import 'package:app/module/mixology/mixology_bloc.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/start.page.dart';
import 'package:app/pages/home.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:app/utils/theme.dart';

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
  final mixology = MixologyBloc();
  final smokeSession = SmokeSessionBloc();
  @override
  void initState() {
    super.initState();

    isUserAuthorized().then((authorized) => setState(() {
          _isAuthorized = authorized;
        }));
  }

   void restartApp() {
    this.setState(() {
      key = new UniqueKey();
    });
  }



  @override
  Widget build(BuildContext context) {  
    return new DataProvider(
        mixology: mixology,
        smokeSession: smokeSession,
        child: MaterialApp(
          navigatorKey: navigatorKey,
          showPerformanceOverlay: false,
          title: 'Manapipes',
          home: _isAuthorized ? new HomePage() : new StartPage(),
          onGenerateRoute: App.router.generator,
          theme: buildDarkTheme(),
        ));
  }

  Future<bool> isUserAuthorized() async {
    final storage = new FlutterSecureStorage();
    String token = await storage.read(key: "accessToken");

    if (token != null) return true;

    return false;
  }
}

import 'dart:async';

import 'package:app/app/app.dart';
import 'package:app/module/mixology/mixology_bloc.dart';
import 'package:app/pages/start.page.dart';
import 'package:app/pages/home.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:app/utils/theme.dart';

class AppWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AppWidgetState();
  }
}

class _AppWidgetState extends State<AppWidget> {
  bool _isAuthorized = false;
  final mixology = MixologyBloc();

  @override
  void initState() {
    super.initState();
    isUserAuthorized().then((authorized) => setState(() {
          _isAuthorized = authorized;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return new DataProvider(
        mixology: mixology,
        child: MaterialApp(
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

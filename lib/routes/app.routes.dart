import 'package:app/pages/SmokeSession/smoke_session_page.dart';
import 'package:app/pages/home.page.dart';
import 'package:app/pages/test_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes(Router router) {
    router.define('home', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new HomePage();
    }));

    router.define('test', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new TestPage();
    }));

    router.define('smokeSession', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new SmokeSessionPage();
    }));
  }
}

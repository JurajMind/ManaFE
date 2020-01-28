import 'package:app/pages/Mixology/mix_detail_page.dart';
import 'package:app/pages/SmokeSession/smoke_session_page.dart';
import 'package:app/pages/enterSmokeSesionCode.page.dart';
import 'package:app/pages/home.page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes(Router router) {
    router.define('home', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new HomePage();
    }));

    router.define('session/start', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new EnterSmokeSessionCode();
    }));

    router.define('smokeSession', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new SmokeSessionPage();
    }));

    router.define('mix', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new MixDetailPage();
    }));
  }
}

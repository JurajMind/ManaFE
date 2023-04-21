import 'dart:convert';

import 'package:app/pages/Mixology/mix_detail_page.dart';
import 'package:app/pages/SmokeSession/smoke_session_page.dart';
import 'package:app/pages/enterSmokeSesionCode.page.dart';
import 'package:app/pages/home.page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

import '../app/app.dart';
import '../pages/home.page_freya.dart';

class AppRoutes {
  final AppType appType;

  AppRoutes(FluroRouter router, this.appType) {
    router.define('home', handler: new Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      if (appType == AppType.freya)
        return new FreyaHomePage();
      else
        return new HomePage();
    }));

    router.define('session/start',
        handler: new Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return new EnterSmokeSessionCode();
    }));

    router.define('smokeSession',
        handler: new Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return new SmokeSessionPage();
    }));

    router.define('mix', handler: new Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      final args = context!.settings!.arguments as TobaccoMixSimpleDto;

      return new MixDetailPage(
        mix: args,
      );
    }));
  }
}

String encodeJsonDataForFluro(Map<String, dynamic> mapToEncode) {
  return jsonEncode(mapToEncode).replaceAll("/", HtmlEscape().convert("/"));
}

Map<String, dynamic> decodeJsonDataForFluro(String encodedMap) {
  return jsonDecode(encodedMap.replaceAll(HtmlEscape().convert("/"), "/"));
}

import 'dart:ui';

import 'package:app/app/app.widget.dart';
import 'package:app/module/cached.bloc.dart';
import 'package:app/routes/app.routes.dart';
import 'package:app/routes/auth.routes.dart';
import 'package:app/services/http.service.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new AppWidget());
}

class App {
  // Application environment.
  static String environment;

  // Application router.
  static Router router;

  // Application providers.
  static ApiClient http;

  static Cache cache;

  static String clientId;

  static String baseUri;

  static String googleApiKeys;

  // Create app.
  App({String environment, String baseUri, String clientId, String googleApiKey}) {
    App.environment = environment;
    App.clientId = clientId;
    App.baseUri = baseUri;
    App.googleApiKeys = googleApiKey;
    // Create app http service.
    App.http = new ApiClient(baseUri);
    App.http.init();
    App.cache = new Cache();
    // Create a router.
    final Router router = new Router();

    // Init and set app router.
    App.router = this.initializeRoutes(router);
  }

  // Let's init our routes.
  Router initializeRoutes(Router router) {
    new AppRoutes(router);
    new AuthRoutes(router);

    return router;
  }

  // App run.
  void run(runApp) {
    runApp(new AppWidget());
  }

  static final List<String> supportedLanguagesCodes = ["en", "cs", "de"];

  static Iterable<Locale> supportedLocales() => supportedLanguagesCodes.map<Locale>((language) => Locale(language, ""));

  static LocaleChangeCallback onLocaleChanged;

  Future onDidReceiveLocalNotification(int id, String title, String body, String payload) async {}

  Future onSelectNotification(String payload) async {}
}

typedef void LocaleChangeCallback(Locale locale);

import 'package:app/pages/Settings/language_selector_page.dart';
import 'package:app/pages/Start/intro.page.dart';
import 'package:app/pages/Start/register.page.dart';
import 'package:app/pages/Start/sign_in.page.dart';
import 'package:app/pages/Start/start.page.dart';
import 'package:app/pages/auth/forgot_password.page.dart';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/Start/cross.page.dart';

class AuthRoutes {
  AuthRoutes(FluroRouter router) {
    router.define('auth/login', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new SignInPage();
    }));

    router.define('auth/register', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new RegisterPage();
    }));

    router.define('auth/forgotpassword', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new ForgotPasswordPage();
    }));

    router.define('auth/lang', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new LanguageSelectorPage();
    }));

    router.define('auth/home', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new StartPage();
    }));

    router.define('auth/intro', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new IntroPage();
    }));

    router.define('auth/cross', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new CrossPage();
    }));
  }
}

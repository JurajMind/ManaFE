import 'package:app/pages/Settings/language_selector_page.dart';
import 'package:app/pages/Start/start.page.dart';
import 'package:app/pages/auth/forgot_password.page.dart';
import 'package:app/pages/auth/login.page.dart';
import 'package:app/pages/auth/register.page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class AuthRoutes {
  AuthRoutes(Router router) {
    router.define('auth/login', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new LoginPage();
    }));

    router.define('auth/register', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new RegisterPage();
    }));

    router.define('auth/forgotpassword', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new ForgotPasswordPage();
    }));

    router.define('auth/lang', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new LanguageSelectorPage();
    }));

    router.define('auth/home', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new StartPage();
    }));
  }
}

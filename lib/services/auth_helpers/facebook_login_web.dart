import 'dart:js';

import 'package:app/app/app.widget.dart';
import 'package:flutter/widgets.dart';

import '../authorization.dart';
import 'auth_interop.dart';

class FacebookLoginHelper {
  final ValueChanged<bool> onAuthBegin;

  FacebookLoginHelper(this.onAuthBegin);
  Future facebookLogin(context) async {
    fbCallback = allowInterop((token) async {
      var auth = new Authorize();
      if (onAuthBegin != null) onAuthBegin(true);
      var tokenResult = await auth.getLocalToken("Facebook", token);
      if (tokenResult) {
        AppWidget.restartApp(context);
      } else {
        onAuthBegin(false);
      }
    });

    var fbToken = fbWebLogin();

    return;
  }
}

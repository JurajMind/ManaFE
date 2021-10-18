import 'package:app/app/app.widget.dart';
import 'package:app/main.dart';
import 'package:app/services/authorization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookLoginHelper {
  final ValueChanged<bool> onAuthBegin;

  FacebookLoginHelper(this.onAuthBegin);
  Future facebookLogin(context) async {
    final LoginResult result = await FacebookAuth.instance
        .login(); // by default we request the email and the public profile
// or FacebookAuth.i.login()
    if (result.status == LoginStatus.success) {
      // you are logged
      final AccessToken accessToken = result.accessToken;
      var auth = getIt.get<AuthorizeRepository>();
      var tokenResult = await auth.getLocalToken("Facebook", accessToken.token);
      if (tokenResult) {
        AppWidget.restartApp(context);
      } else {
        onAuthBegin(false);
      }
    } else {
      print(result.status);
      print(result.message);
    }
  }
}

import 'package:app/app/app.dart';
import 'package:app/app/app.widget.dart';
import 'package:app/services/auth_helpers/auth_interop.dart';
import 'package:app/services/authorization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:js/js.dart';

import 'custom_web_view.dart';

class ExternalAuthWidget extends StatelessWidget {
  final ValueChanged<bool> onAuthBegin;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ExternalAuthWidget({
    Key key,
    this.onAuthBegin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 2,
              width: 50,
              color: Colors.white,
            ),
            Text('  Or connect using  '),
            Container(
              height: 2,
              width: 50,
              color: Colors.white,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          constraints: BoxConstraints(maxWidth: 600),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  onPressed: () => facebookLogin(context),
                  icon: Icon(
                    FontAwesomeIcons.facebook,
                    size: 40,
                  ),
                ),
                IconButton(
                  onPressed: () => googleLogin(context),
                  icon: Icon(
                    FontAwesomeIcons.google,
                    size: 40,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.apple,
                    size: 40,
                  ),
                  onPressed: () {},
                )
              ]),
        )
      ],
    );
  }

  Future googleLogin(context) async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

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

    String result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CustomWebView(
                  selectedUrl:
                      'https://www.facebook.com/dialog/oauth?client_id=${App.facebookClientId}&redirect_uri=${App.your_redirect_url}&response_type=token&scope=email,public_profile,',
                ),
            maintainState: true));

    if (result != null) {
      try {
        final facebookAuthCred =
            FacebookAuthProvider.getCredential(accessToken: result);

        final user = await _auth.signInWithCredential(facebookAuthCred);
      } catch (e) {}
    }
  }
}

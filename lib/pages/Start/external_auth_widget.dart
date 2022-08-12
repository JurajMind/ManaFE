import 'package:app/app/app.widget.dart';
import 'package:app/main.dart';
import 'package:app/services/auth_helpers/facebook_login_mobile.dart';
import 'package:app/services/authorization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class ExternalAuthWidget extends StatelessWidget {
  final ValueChanged<bool>? onAuthBegin;

  ExternalAuthWidget({
    Key? key,
    this.onAuthBegin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var facebookHelper = FacebookLoginHelper(onAuthBegin);
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
                  onPressed: () => facebookHelper.facebookLogin(context),
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
                  onPressed: null,
                )
              ]),
        )
      ],
    );
  }

  Future googleLogin(context) async {
    try {
      var result = await (_googleSignIn.signIn() as FutureOr<GoogleSignInAccount>);
      var auth = getIt.get<AuthorizeRepository>();
      var authToken = await result.authentication;
      var tokenResult =
          await auth.getLocalToken("Google", authToken.accessToken);
      if (tokenResult) {
        AppWidget.restartApp(context);
      } else {
        onAuthBegin!(false);
      }
    } catch (error) {
      print(error);
    }
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
}

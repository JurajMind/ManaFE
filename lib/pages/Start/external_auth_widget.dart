import 'package:app/app/app.widget.dart';
import 'package:app/services/authorization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExternalAuthWidget extends StatelessWidget {
  final ValueChanged<bool> onAuthBegin;

  const ExternalAuthWidget({
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
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
            IconButton(
              onPressed: () => facebookLogin(context),
              icon: Icon(
                FontAwesomeIcons.facebook,
                size: 40,
              ),
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.google,
                size: 40,
              ),
              onPressed: () {},
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

  Future facebookLogin(context) async {
    var facebookLogin = new FacebookLogin();
    var result = await facebookLogin.logIn(['email']);
    try {
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          {
            var auth = new Authorize();
            onAuthBegin(true);
            var tokenResult = await auth.getLocalToken("Facebook", result.accessToken.token);
            if (tokenResult) {
              AppWidget.restartApp(context);
            } else {
              onAuthBegin(false);
            }
            break;
          }

        case FacebookLoginStatus.cancelledByUser:
          break;
        case FacebookLoginStatus.error:
          break;
      }
    } catch (e) {
      AppWidget.restartApp(context);
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text("Facebook login error :("),
      ));
    }
  }
}

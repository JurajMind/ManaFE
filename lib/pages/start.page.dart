import 'dart:async';

import 'package:animated_background/animated_background.dart';
import 'package:app/helpers.dart';
import 'package:app/pages/home.page.dart';
import 'package:app/services/authorization.dart';
import 'package:flutter/material.dart';
import 'package:app/components/Buttons/roundedButton.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class StartPage extends StatefulWidget {
  @override
  StartPageState createState() {
    return new StartPageState();
  }
}

class StartPageState extends State<StartPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: new Scaffold(
          body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(
            options: ParticleOptions(baseColor: Colors.blue)),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                  padding: new EdgeInsets.all(40.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Container(
                        child: Image.asset(
                          'images/logo.png',
                          fit: BoxFit.scaleDown,
                          height: 200.0,
                        ),
                      ),
                      new Container(
                        width: screenSize.width,
                        child: new RoundedButton(
                          buttonName: 'Sign up',
                          onTap: () {
                            navigate(context, 'auth/register');
                          },
                          buttonColor: Colors.transparent,
                          borderWidth: 1.0,
                          bottomMargin: 1.0,
                          height: 50.0,
                          width: screenSize.width,
                        ),
                        margin: new EdgeInsets.only(top: 20.0),
                      ),
                      new Container(
                        width: screenSize.width,
                        child: new RoundedButton(
                          buttonName: 'Facebook login',
                          onTap: () {
                            facebookLogin();
                          },
                          buttonColor: Colors.white,
                          borderWidth: 1.0,
                          bottomMargin: 1.0,
                          height: 50.0,
                          width: screenSize.width,
                          textColor: Colors.black,
                        ),
                        margin: new EdgeInsets.only(top: 20.0),
                      ),
                      new Container(
                        width: screenSize.width,
                        child: new FlatButton(
                          child: new Text(
                            'I alredy have an account',
                          ),
                          onPressed: () {
                            navigate(context, 'auth/login');
                          },
                        ),
                        margin: new EdgeInsets.only(top: 20.0),
                      )
                    ],
                  ))
            ],
          ),
        ),
      )),
    );
  }

  Future facebookLogin() async {
    var facebookLogin = new FacebookLogin();
    var result = await facebookLogin
        .logInWithReadPermissions(['email', 'user_friends', 'user_posts']);
    try {
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          {
            var auth = new Authorize();
            var tokenResult =
                await auth.getLocalToken("Facebook", result.accessToken.token);
            if (tokenResult) {
              Navigator.pushReplacement(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()));
            }
            break;
          }

        case FacebookLoginStatus.cancelledByUser:
          break;
        case FacebookLoginStatus.error:
          break;
      }
    } catch (e) {
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text("Facebook login error :("),
      ));
    }
  }
}

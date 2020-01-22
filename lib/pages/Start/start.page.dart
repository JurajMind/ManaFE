import 'dart:async';

import 'package:animated_background/animated_background.dart';
import 'package:app/Helpers/helpers.dart';
import 'package:app/app/app.widget.dart';
import 'package:app/const/theme.dart';
import 'package:app/pages/Start/sign_in.page.dart';
import 'package:app/pages/auth/AppleSignIn/apple_sign_in.dart';
import 'package:app/services/authorization.dart';
import 'package:app/utils/translations/app_translations.dart';
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
  bool facebookLoginLoading = false;

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

    return new Scaffold(
        body: AnimatedBackground(
      vsync: this,
      behaviour: RandomParticleBehaviour(options: ParticleOptions(baseColor: Colors.blue)),
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
                constraints: BoxConstraints(maxWidth: 500),
                padding: new EdgeInsets.all(40.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Welcome to Manapipes',
                      style: Theme.of(context).textTheme.headline,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    new Container(
                      child: Image.asset(
                        'images/logo.png',
                        fit: BoxFit.scaleDown,
                        height: 200.0,
                      ),
                    ),
                    new Container(
                      width: screenSize.width,
                      child: facebookLoginLoading
                          ? Container(height: 20, width: 20, child: CircularProgressIndicator())
                          : MaterialButton(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  AppTranslations.of(context).text("Start").toUpperCase(),
                                  style: Theme.of(context).textTheme.body2.apply(color: Colors.black),
                                ),
                              ),
                              onPressed: () {},
                              color: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(24.0)),
                              textColor: Colors.black,
                            ),
                      margin: new EdgeInsets.only(top: 25.0),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Already have an account? ',
                          style: Theme.of(context).textTheme.display2.apply(fontWeightDelta: 0),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {
                            return SignInPage();
                          })),
                          child: Text(
                            'SIGN IN',
                            style: Theme.of(context)
                                .textTheme
                                .display2
                                .apply(fontWeightDelta: 10, color: AppColors.colors[3], decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                    Align(
                      heightFactor: 1,
                      alignment: Alignment.bottomCenter,
                      child: new FlatButton(
                        child: new Text(
                          AppTranslations.of(context).currentLanguage.toString().toUpperCase(),
                          style: Theme.of(context).textTheme.display2,
                        ),
                        onPressed: () {
                          navigate(context, 'auth/lang');
                        },
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}

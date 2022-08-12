import 'package:animated_background/animated_background.dart';
import 'package:app/Helpers/helpers.dart';
import 'package:app/const/theme.dart';
import 'package:app/pages/Start/sign_in.page.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';

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
      behaviour: RandomParticleBehaviour(
          options: ParticleOptions(baseColor: Colors.blue)),
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                'Welcome to Manapipes',
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
            ManaLogoW(),
            new Container(
              child: MaterialButton(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                  child: Text(
                    AppTranslations.of(context)!.text("Start").toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .apply(color: Colors.black, fontSizeDelta: -7),
                  ),
                ),
                onPressed: () => navigate(context, 'auth/intro'),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(24.0)),
                textColor: Colors.black,
              ),
              margin: new EdgeInsets.only(top: 25.0),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () => Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (BuildContext context) {
                return SignInPage();
              })),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    Text(
                      'Already have an account? ',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .apply(fontWeightDelta: 0),
                    ),
                    Text(
                      'SIGN IN',
                      style: Theme.of(context).textTheme.headline5!.apply(
                          fontWeightDelta: 10,
                          color: AppColors.colors[3],
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              heightFactor: 1,
              alignment: Alignment.bottomCenter,
              child: new TextButton(
                child: new Text(
                  AppTranslations.of(context)!
                      .currentLanguage
                      .toString()
                      .toUpperCase(),
                  style: Theme.of(context).textTheme.headline5,
                ),
                onPressed: () {
                  navigate(context, 'auth/lang');
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class ManaLogoW extends StatefulWidget {
  const ManaLogoW({
    Key? key,
  }) : super(key: key);

  @override
  _ManaLogoWState createState() => _ManaLogoWState();
}

class _ManaLogoWState extends State<ManaLogoW> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Image.asset(
        'images/logo.png',
        fit: BoxFit.scaleDown,
        height: 200.0,
      ),
    );
  }
}

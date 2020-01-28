import 'package:app/Helpers/helpers.dart';
import 'package:app/pages/Start/external_auth_widget.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';

class CrossPage extends StatelessWidget {
  const CrossPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Flexible(
              flex: 2,
              child: new Container(
                child: Image.asset(
                  'assets/mana_logo_black.png',
                  fit: BoxFit.scaleDown,
                  height: 120.0,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                "Bring a little magic into your smoking session",
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            new Container(
              child: MaterialButton(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                  child: Text(
                    AppTranslations.of(context).text("Sign up"),
                    style: Theme.of(context).textTheme.headline4.apply(color: Colors.black, fontSizeDelta: -15),
                  ),
                ),
                onPressed: () => navigate(context, 'auth/register'),
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(24.0)),
                textColor: Colors.black,
              ),
            ),
            new Container(
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.white, width: 1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                  child: Text(
                    AppTranslations.of(context).text(" Log in "),
                    style: Theme.of(context).textTheme.headline4.apply(fontSizeDelta: -15),
                  ),
                ),
                onPressed: () => navigate(context, 'auth/login'),
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(24.0)),
                textColor: Colors.black,
              ),
            ),
            Expanded(flex: 1, child: Container()),
            Expanded(flex: 1, child: Container(child: Align(alignment: Alignment.bottomCenter, child: ExternalAuthWidget())))
          ],
        ),
      ),
    );
  }
}

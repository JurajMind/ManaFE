import 'package:app/Helpers/helpers.dart';
import 'package:app/pages/Start/external_auth_widget.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';

import '../../components/Buttons/m_outlineButton.dart';

class FreyaStartPage extends StatelessWidget {
  const FreyaStartPage({Key? key}) : super(key: key);

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
              flex: 3,
              child: new Container(
                child: Image.asset(
                  'assets/dymka.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            MButton(
              label: AppTranslations.of(context)!.text("Sign up"),
              onPressed: () => navigate(context, 'auth/register'),
            ),
            const SizedBox(
              height: 40,
            ),
            MButton(
              label: AppTranslations.of(context)!.text(" Log in "),
              onPressed: () => navigate(context, 'auth/login'),
              dark: false,
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
                flex: 1, child: Container(child: Align(alignment: Alignment.bottomCenter, child: ExternalAuthWidget())))
          ],
        ),
      ),
    );
  }
}

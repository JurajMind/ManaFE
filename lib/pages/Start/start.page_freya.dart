import 'package:app/Helpers/helpers.dart';

import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';

class FreyaStartPage extends StatefulWidget {
  @override
  FreyaStartPageState createState() {
    return new FreyaStartPageState();
  }
}

class FreyaStartPageState extends State<FreyaStartPage> with TickerProviderStateMixin {
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
    return new Scaffold(
        body: new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        MaterialButton(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
            child: Text(
              AppTranslations.of(context)!.text("Start").toUpperCase(),
              style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.black, fontSizeDelta: -7),
            ),
          ),
          onPressed: () => navigate(context, 'auth/intro'),
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(24.0)),
          textColor: Colors.black,
        ),
        new TextButton(
          child: new Text(
            AppTranslations.of(context)!.currentLanguage.toString().toUpperCase(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          onPressed: () {
            navigate(context, 'auth/lang');
          },
        )
      ],
    ));
  }
}

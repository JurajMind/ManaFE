import 'package:app/app/app.widget.dart';
import 'package:app/components/Buttons/m_outlineButton.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/person/person_bloc.dart';
import 'package:app/pages/Settings/language_selector_page.dart';
import 'package:app/pages/Statistic/Setting/person_info.dart';
import 'package:app/services/authorization.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openapi/api.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'.toUpperCase()),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 16,
            ),
            InkWell(
              child: FractionallySizedBox(
                widthFactor: 0.6,
                child: Container(
                    color: Colors.black.withOpacity(0.3),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Language: ${AppTranslations.of(context).locale.languageCode}',
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ))),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LanguageSelectorPage())),
            ),
            const SizedBox(
              height: 16,
            ),
            new PersonInfo(),
            const SizedBox(
              height: 16,
            ),
            Card(
              color: Colors.black.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(Icons.help),
                        const SizedBox(
                          width: 8,
                        ),
                        Text('Support',
                            style: Theme.of(context).textTheme.display1),
                      ],
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.university),
                      title: Text('Tutorial'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.at),
                      title: Text('Contact support'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.star),
                      title: Text('Rate application'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.share),
                      title: Text('Share'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            FractionallySizedBox(
              widthFactor: 0.6,
              child: MButton(
                icon: FontAwesomeIcons.signOutAlt,
                label: 'Sign out',
                onPressed: () {
                  Authorize auth = new Authorize();
                  auth.signOut();
                  AppWidget.restartApp(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

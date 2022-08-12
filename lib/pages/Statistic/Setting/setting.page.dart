import 'package:app/app/app.widget.dart';
import 'package:app/components/Buttons/m_outlineButton.dart';
import 'package:app/main.dart';
import 'package:app/pages/Settings/language_selector_page.dart';
import 'package:app/pages/Statistic/Setting/person_info.dart';
import 'package:app/services/authorization.dart';
import 'package:app/theme/theme_widget.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key? key}) : super(key: key);

  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    var theme = MTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'.toUpperCase(), style: theme.appBarStyle),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          constraints: theme.pageConstrains as BoxConstraints?,
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 16,
              ),
              InkWell(
                child: Container(
                    color: Colors.black.withOpacity(0.3),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Language: ${AppTranslations.of(context)!.locale.languageCode}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ))),
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
                              style: Theme.of(context).textTheme.headline6),
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
                  onPressed: () async {
                    AuthorizeRepository auth = getIt.get<AuthorizeRepository>();
                    await auth.signOut();
                    AppWidget.restartApp(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

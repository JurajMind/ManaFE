import 'package:app/pages/Settings/language_selector_page.dart';
import 'package:app/pages/Statistic/test_page.dart';

import 'package:app/services/authorization.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/Statistic/statistic_page.dart';

class DesignStatisticPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print('Profile');
    return new _DesignStatisticPageState();
  }
}

class _DesignStatisticPageState extends State<DesignStatisticPage> {
  Authorize auth = new Authorize();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/stats.png"),
              fit: BoxFit.fitWidth,
              alignment: Alignment(0.0, -1.0))),
      child: new Column(
        children: <Widget>[
          new AppBar(
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              new PopupMenuButton(
                onSelected: (String value) {
                  switch (value) {
                    case 'settings':
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LanguageSelectorPage()));
                      break;
                    case 'signOut':
                      auth.signOut();
                      break;
                    case 'test':
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => StatisticPage()));
                      break;
                    case 'testPage':
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => TestPage()));
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        value: "settings",
                        child: Text('Settings'),
                      ),
                     
                      PopupMenuItem(
                        value: "test",
                        child: Text('Test statistic'),
                      ),
                      PopupMenuItem(
                        value: "testPage",
                        child: Text('Test page'),
                      ),
                         PopupMenuItem(
                        value: "signOut",
                        child: Text('Sign out'),
                      ),
                    ],
              )
            ],
          ),
          new Center(
              child: Column(
            children: <Widget>[],
          )),
        ],
      ),
    );
  }
}

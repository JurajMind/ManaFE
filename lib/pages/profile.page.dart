import 'package:app/pages/Settings/language_selector_page.dart';
import 'package:app/services/authorization.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print('Profile');
    return new _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
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
                  }
                },
                itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        value: "settings",
                        child: Text('Settings'),
                      ),
                      PopupMenuItem(
                        value: "signOut",
                        child: Text('Sign out'),
                      )
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

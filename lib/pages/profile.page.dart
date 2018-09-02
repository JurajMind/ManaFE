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
    return new Column(
      children: <Widget>[
        new AppBar(
          title: new Text('ProfilePage',style: TextStyle(
            fontWeight: FontWeight.w700
          ),),
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: <Widget>[
            new PopupMenuButton(
              onSelected: (String value){
                switch (value){
                  case 'settings':
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
          children: <Widget>[
            new Text('You are in profile page!'),
            new RaisedButton(
              onPressed: () {
                auth.signOut();
              },
              child: Text('Log off'),
            )
          ],
        )),
      ],
    );
  }
}

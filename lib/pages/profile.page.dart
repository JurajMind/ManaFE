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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ProfilePage'),
      ),
      body: new Center(
          child: Column(
            children: <Widget>[
              new Text('You are in profile page!'),
              new RaisedButton(
                onPressed: () {auth.signOut();},
                child: Text('Log off'),
              )
            ],
          )
      ),
    );
  }
}
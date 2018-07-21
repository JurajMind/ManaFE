import 'package:flutter/material.dart';

class SmokeSessionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SmokeSessionPage();
  }
}

class _SmokeSessionPage extends State<SmokeSessionPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('SmokeSession'),
      ),
      body: new Center(
          child: new Text('You are in Gear page!')
      ),
    );
  }
}
import 'package:flutter/material.dart';

class GearPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _GearPageState();
  }
}

class _GearPageState extends State<GearPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Gear'),
      ),
      body: new Center(
          child: new Text('You are in Gear page!')
      ),
    );
  }
}
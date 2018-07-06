import 'package:flutter/material.dart';

class PlacePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _PlacePageState();
  }
}

class _PlacePageState extends State<PlacePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Place'),
      ),
      body: new Center(
          child: new Text('You are in place page!')
      ),
    );
  }
}
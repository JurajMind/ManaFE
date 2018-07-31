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
    return new Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        new AppBar(
          title: new Text('Place'),
        ),
        Container(child: new Center(child: new Text('You are in place page!'))),
      ],
    );
  }
}

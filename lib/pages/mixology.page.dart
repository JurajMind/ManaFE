import 'package:flutter/material.dart';

class MixologyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MixologyPageState();
  }
}

class _MixologyPageState extends State<MixologyPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(     
      body: new Center(
          child: new Text('You are in Mixology page!')
      ),
    );
  }
}
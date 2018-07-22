import 'package:app/module/mixology/mixology_bloc.dart';
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

  final smokeSessionBloc = DataProvider.getSmokeSession(context);
StreamBuilder<int> builder = new StreamBuilder(
  stream: smokeSessionBloc.smokeState,
  builder: (context,asyncSnapshot){
    return new Text(asyncSnapshot.data.toString());
  },
);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('SmokeSession'),
      ),
      body: new Center(
          child: Column(
            children: <Widget>[
              new Text('You are in Gear page!'),
            builder
            ],
          )
      ),
    );
  }
}
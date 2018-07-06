import 'package:app/components/Backgrund.dart';
import 'package:flutter/material.dart';
import 'package:carousel/carousel.dart';

class StartSmokeSessionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _StartSmokeSessionState();
  }
}

class _StartSmokeSessionState extends State<StartSmokeSessionPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
    
      body: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Row(
              children: <Widget>[Icon(Icons.access_alarm)],
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.all(100.0),
                decoration: new BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
              ),
            ),
            new Text('You are in Start smoke session page!'),
            FlatButton.icon(
              icon: Icon(Icons.hd),
              label: Text('test'),
              onPressed: () => {},
            ),
            new LogoWidget()
          ]),
    );
  }
}

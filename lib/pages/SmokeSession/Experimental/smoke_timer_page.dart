import 'package:flutter/material.dart';

class SmokeTimerPage extends StatefulWidget {
  @override
  _SmokeTimerPageState createState() => new _SmokeTimerPageState();
}

class _SmokeTimerPageState extends State<SmokeTimerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smoke timer'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Placeholder(),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  Text(
                    'TOP',
                    style: Theme.of(context).textTheme.display1,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

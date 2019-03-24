import 'package:flutter/material.dart';

class GearPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _GearPageState();
  }
}

class _GearPageState extends State<GearPage> {
  @override
  FocusNode _focusNode = new FocusNode();
  Widget build(BuildContext context) {
    return Material(
      child: new Container(
        child: new Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('You are in Gear page!'),
            new TextFormField(
              focusNode: _focusNode,
            ),
            RaisedButton(
              child: Text('Test'),
              onPressed: () => Scaffold.of(context).showSnackBar(new SnackBar(
                    content: new Text("Sending Message"),
                  )),
            )
          ],
        )),
      ),
    );
  }
}

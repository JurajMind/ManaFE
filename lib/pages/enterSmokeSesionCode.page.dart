import 'package:app/helpers.dart';
import 'package:flutter/material.dart';

class EnterSmokeSessionCode extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new EnterSmokeSessionCodeState();
    // TODO: implement createState
  }
}

class EnterSmokeSessionCodeState extends State<EnterSmokeSessionCode> {
  final double topWidgetHeight = 200.0;
  String _sessionCode;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.black,
        ),
        body: Stack(
          children: <Widget>[
            new Positioned(
              child: CircleAvatar(
                radius: getCircleRadius(context),
                backgroundColor: Colors.red,
                child: Center(
                    widthFactor: 0.4,
                    child: new Padding(
                        padding:
                            new EdgeInsets.fromLTRB(40.0, 140.0, 40.0, 0.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                              "Enter session code",
                              textScaleFactor: 2.0,
                            ),
                            new Form(
                              child: new Column(
                                children: <Widget>[
                                  new Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: new TextFormField(
                                      onSaved: (val) => _sessionCode = val,
                                      decoration: new InputDecoration(
                                          labelText: "Session code"),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ))),
              ),
              left: (MediaQuery.of(context).size.width / 2) -
                  getCircleRadius(context),
              top: topWidgetHeight - getCircleRadius(context),
            )
          ],
        ));
  }

  void _submit() {
    print(this._sessionCode);
  }
}

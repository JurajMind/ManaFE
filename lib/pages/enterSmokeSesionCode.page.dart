import 'package:app/helpers.dart';
import 'package:app/pages/SmokeSession/smoke_session_page.dart';
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
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: Stack(
      children: <Widget>[
        new AppBar(
          backgroundColor: Colors.transparent,
          
        ),
        new Positioned(
          child: CircleAvatar(
            radius: getCircleRadius(context),
            backgroundColor: Colors.red,
            child: Center(
                widthFactor: 0.4,
                child: new Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          "Enter session code",
                          textScaleFactor: 2.0,
                          style: TextStyle(color: Colors.white),
                        ),
                        new Form(
                          key: _formKey,
                          child: new Column(
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: new TextFormField(
                                  maxLength: 5,
                                  controller: myController,                                  
                                  validator: (val) {
                                    return myController.text.length != 5
                                        ? "Session code must have 5 chars"
                                        : null;
                                  },
                                  style: TextStyle(fontSize: 20.0),
                                  textAlign: TextAlign.center,
                                  autocorrect: false,
                                  decoration: new InputDecoration(
                                    labelText: "Session code",
                                  ),
                                ),
                              ),
                              new Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new RaisedButton(
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      Navigator.pop(context, myController.text);
                                    }
                                  },
                                  child: new Text('Enter'),
                                  color: Colors.red,
                                ),
                              )
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

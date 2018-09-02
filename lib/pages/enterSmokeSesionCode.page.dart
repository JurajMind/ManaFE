import 'dart:async';

import 'package:app/app/app.dart';
import 'package:app/components/Buttons/roundedButton.dart';
import 'package:app/helpers.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/gradiend_color_wheel.dart';
import 'package:app/pages/SmokeSession/smoke_session_page.dart';
import 'package:app/services/http.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrcode_reader/QRCodeReader.dart';

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
  final ApiClient apiClient = App.http;
  bool validating = false;
  @override
  Widget build(BuildContext context) {
    final smokeSessionBloc = DataProvider.getSmokeSession(context);

    return new SafeArea(
        child: Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: <Widget>[
        new Positioned(
          child: GradientColorWheel(
            size: Size(
                getCircleRadius(context) * 2, getCircleRadius(context) * 2),
            defaultColors: [Colors.red, Colors.blue],
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
                                  inputFormatters: [UpperCaseTextFormatter()],
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
                                child: new RoundedButton(
                                  borderWidth: 2.0,
                                  height: 50.0,
                                  bottomMargin: 1.0,
                                  width: 180.0,
                                  onTap: () async {                                 
                                    if (_formKey.currentState.validate()) {
                                         setState(() {
                                      validating = true;
                                    });
                                      await validateAndGo(
                                          context, myController.text);
                                    }
                                  },
                                  child: validating
                                      ? new Text('Validating')
                                      : new Text('Enter'),
                                  buttonColor: Colors.transparent,
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
        ),
        Positioned(
            bottom: 20.0,
            width: MediaQuery.of(context).size.width,
            height: 100.0,
            child: buildRecentSessions(smokeSessionBloc)),
        Positioned(
          right: 20.0,
          top: topWidgetHeight + getCircleRadius(context) / 2 + 20,
          child: InkWell(
            onTap: () {
              Future<String> futureString = new QRCodeReader().scan();
              futureString.then((smokeSessionLink) async {
                if (smokeSessionLink != null &&
                    smokeSessionLink.contains("/smoke/")) {
                  var sessionCode = smokeSessionLink.split('/').last;
                  myController.text = sessionCode;
                  await validateAndGo(context, sessionCode);
                }
              });
            },            
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: new BoxDecoration(
                  color: Colors.grey,shape: BoxShape.circle,                  
                  border: new Border.all(
                      color: const Color.fromRGBO(221, 221, 221, 1.0),
                      width: 2.5)),
              child: Icon(Icons.camera),
            ),
          ),
        ),
        Positioned(
            top: 10.0,
            child: IconButton(
              icon: Icon(
                Icons.chevron_left,
                size: 50.0,
              ),
              onPressed: () => Navigator.pop(context),
            ))
      ],
    ));
  }

  Future validateAndGo(BuildContext context, String sessionId) async {
    var result = await apiClient.validateSessionId(sessionId);
    setState(() {
      validating = false;
    });
    if (result.id != null) {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(
        builder: (BuildContext context) {
          return new SmokeSessionPage(sessionId: sessionId);
        },
      ));
    } else {
      Scaffold.of(context).showSnackBar(new SnackBar(
            content: new Text("Invalid session code"),
          ));
    }
  }

  void _submit() {
    print(this._sessionCode);
  }

  StreamBuilder<List<String>> buildRecentSessions(SmokeSessionBloc bloc) {
    return StreamBuilder<List<String>>(
        initialData: new List<String>(),
        stream: bloc.recentSessions.stream,
        builder: (context, snapshot) => ListView.builder(
              itemCount: snapshot.data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  sessionCode(snapshot.data[index]),
            ));
  }

  Widget sessionCode(String sessionCode) {
    return Padding(padding: EdgeInsets.all(8.0), child: Text('d'));
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue) {
    return new TextEditingValue(
      text: newValue.text?.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

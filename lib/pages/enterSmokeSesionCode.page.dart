import 'dart:async';

import 'package:app/app/app.dart';
import 'package:app/components/Buttons/roundedButton.dart';
import 'package:app/components/Common/circle_painter.dart';
import 'package:app/components/SmokeSession/smoke_session_carousel.dart';
import 'package:app/Helpers/helpers.dart';
import 'package:app/pages/SmokeSession/smoke_session_page.dart';
import 'package:app/services/http.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrcode_reader/qrcode_reader.dart';

class EnterSmokeSessionCode extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new EnterSmokeSessionCodeState();
}

class EnterSmokeSessionCodeState extends State<EnterSmokeSessionCode> {
  final double topWidgetHeight = 200.0;
  String _sessionCode;
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController(text: 'VV49Y');
  final ApiClient apiClient = App.http;
  bool validating = false;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: SizedBox(
        height: 55,
      ),
      resizeToAvoidBottomInset: false,
      body: CustomPaint(
        painter: CirclePainter(Colors.red),
        child: Column(
          children: <Widget>[
            new AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            new Expanded(
              flex: 4,
              child: Container(
                height: getCircleRadius(context) * 2,
                width: getCircleRadius(context) * 2,
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
                                      maxLines: 1,
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      inputFormatters: [
                                        UpperCaseTextFormatter()
                                      ],
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
                                        labelStyle: TextStyle(
                                          color: Colors.white,
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          // width: 0.0 produces a thin "hairline" border
                                          borderSide: const BorderSide(
                                              color: Colors.white, width: 3.0),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          // width: 0.0 produces a thin "hairline" border
                                          borderSide: const BorderSide(
                                              color: Colors.white, width: 3.0),
                                        ),
                                        border: const OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Container(),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8.0),
                                          child: new RoundedButton(
                                            borderWidth: 2.0,
                                            height: 50.0,
                                            bottomMargin: 1.0,
                                            width: 180.0,
                                            onTap: () async {
                                              if (validating == true) return;
                                              if (_formKey.currentState
                                                  .validate()) {
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
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                            onTap: () {
                                              Future<String> futureString =
                                                  new QRCodeReader().scan();
                                              futureString.then(
                                                  (smokeSessionLink) async {
                                                if (smokeSessionLink != null &&
                                                    smokeSessionLink
                                                        .contains("/smoke/")) {
                                                  var sessionCode =
                                                      smokeSessionLink
                                                          .split('/')
                                                          .last;
                                                  myController.text =
                                                      sessionCode;
                                                  await validateAndGo(
                                                      context, sessionCode);
                                                }
                                              });
                                            },
                                            child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: new BoxDecoration(
                                                  color: Colors.grey,
                                                  shape: BoxShape.circle,
                                                  border: new Border.all(
                                                      color:
                                                          const Color.fromRGBO(
                                                              221,
                                                              221,
                                                              221,
                                                              1.0),
                                                      width: 2.5)),
                                              child: Icon(
                                                Icons.linked_camera,
                                                size: 20.0,
                                              ),
                                            )),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ))),
              ),
            ),
            Expanded(flex: 2, child: SmokeSessionCarousel()),
          ],
        ),
      ),
    );
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
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text("Invalid session code"),
      ));
    }
  }

  void _submit() {
    print(this._sessionCode);
  }

  Widget sessionCode(String sessionCode) {
    return Padding(padding: EdgeInsets.all(8.0), child: Text('d'));
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  WhitelistingTextInputFormatter formatter =
      WhitelistingTextInputFormatter(new RegExp(r'[A-Z0-9]*'));
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    TextEditingValue formattedValue =
        formatter.formatEditUpdate(oldValue, newValue);
    if (oldValue.text == newValue.text) {
      return newValue;
    }
    final int newTextLength = formattedValue.text.length;

    int selectionIndex = formattedValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = new StringBuffer();

    return new TextEditingValue(
      text: newValue.text?.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

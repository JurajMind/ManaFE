import 'dart:async';

import 'package:app/app/app.dart';
import 'package:app/components/Buttons/roundedButton.dart';
import 'package:app/components/Common/circle_painter.dart';
import 'package:app/components/SmokeSession/smoke_session_carousel.dart';
import 'package:app/Helpers/helpers.dart';
import 'package:app/main.dart';
import 'package:app/module/module.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/smoke_session_page.dart';
import 'package:app/services/http.service.dart';
import 'package:app/theme/theme_widget.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'SmokeSession/qr_code_reader_page.dart';

class EnterSmokeSessionCode extends StatefulWidget {
  final GlobalKey<NavigatorState>? Function(int)? callback;

  const EnterSmokeSessionCode({Key? key, this.callback}) : super(key: key);
  @override
  State<StatefulWidget> createState() => new EnterSmokeSessionCodeState();
}

class EnterSmokeSessionCodeState extends State<EnterSmokeSessionCode> {
  final double topWidgetHeight = 200.0;
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  final ApiClient? apiClient = App.http;
  bool validating = false;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future sleep() {
    return new Future.delayed(const Duration(seconds: 5), () => "5");
  }

  @override
  void initState() {
    new Future.delayed(Duration.zero, () {
      var bloc = getIt.get<PersonBloc>();
      bloc.loadSessions();
      var sessionBloc = getIt.get<SmokeSessionBloc>();
      setState(() {
        if (sessionBloc.lastSession.hasValue) {
          myController.text = sessionBloc.lastSession.value!;
        }
      });
    });
    super.initState();
    sleep();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = MTheme.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      key: _scaffoldKey,
      bottomNavigationBar: SizedBox(
        height: 55,
      ),
      resizeToAvoidBottomInset: false,
      body: CustomPaint(
        painter: CirclePainter(Colors.red, data: MediaQuery.of(context)),
        child: Column(
          children: <Widget>[
            new AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            new Expanded(
              flex: 4,
              child: Container(
                constraints: BoxConstraints(maxWidth: 500),
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
                            new Text(AppTranslations.of(context)!.text('enter_code.enter_session_code'),
                                textScaleFactor: 2.0, style: Theme.of(context).textTheme.bodyMedium),
                            new Form(
                              key: _formKey,
                              child: new Column(
                                children: <Widget>[
                                  new Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: new TextFormField(
                                      maxLines: 1,
                                      textCapitalization: TextCapitalization.characters,
                                      inputFormatters: [UpperCaseTextFormatter()],
                                      maxLength: 5,
                                      controller: myController,
                                      validator: (val) {
                                        return myController.text.length != 5 ? "Session code must have 5 chars" : null;
                                      },
                                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                                      textAlign: TextAlign.center,
                                      autocorrect: false,
                                      decoration: new InputDecoration(
                                        labelText: AppTranslations.of(context)!.text('enter_code.session_code'),
                                        labelStyle: TextStyle(
                                          color: Colors.white,
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          // width: 0.0 produces a thin "hairline" border
                                          borderSide: const BorderSide(color: Colors.white, width: 3.0),
                                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          // width: 0.0 produces a thin "hairline" border
                                          borderSide: const BorderSide(color: Colors.white, width: 3.0),
                                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                        ),
                                        errorBorder: const OutlineInputBorder(
                                          // width: 0.0 produces a thin "hairline" border
                                          borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                        ),
                                        focusedErrorBorder: const OutlineInputBorder(
                                          // width: 0.0 produces a thin "hairline" border
                                          borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
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
                                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                          child: new RoundedButton(
                                            borderWidth: 2.0,
                                            height: 50.0,
                                            bottomMargin: 1.0,
                                            width: 180.0,
                                            onTap: () async {
                                              if (validating == true) return;
                                              if (_formKey.currentState!.validate()) {
                                                setState(() {
                                                  validating = true;
                                                });
                                                await validateAndGo(context, myController.text);
                                              }
                                            },
                                            child: validating
                                                ? new Text(AppTranslations.of(context)!.text('enter_code.validating'))
                                                : new Text(AppTranslations.of(context)!.text('enter_code.enter')),
                                            buttonColor: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                            onTap: () => Navigator.of(context).push<String>(
                                                    new MaterialPageRoute(builder: (BuildContext context) {
                                                  return new QrCodeReader();
                                                })).then((smokeSessionLink) async {
                                                  if (smokeSessionLink != null &&
                                                      smokeSessionLink.contains("/smoke/")) {
                                                    var sessionCode = smokeSessionLink.split('/').last.trim();
                                                    myController.text = sessionCode;
                                                    await validateAndGo(context, sessionCode);
                                                  }
                                                }),
                                            child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: new BoxDecoration(
                                                  color: Colors.grey,
                                                  shape: BoxShape.circle,
                                                  border: new Border.all(
                                                      color: const Color.fromRGBO(221, 221, 221, 1.0), width: 2.5)),
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
            Expanded(
                flex: 2,
                child: Center(
                  child: Container(
                    constraints: theme.pageConstrains as BoxConstraints?,
                    child: SmokeSessionCarousel(
                      callback: widget.callback,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Future validateAndGo(BuildContext context, String sessionId) async {
    var result = await apiClient!.validateSessionId(sessionId);
    setState(() {
      validating = false;
    });
    if (result.id != null) {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(
        builder: (BuildContext context) {
          return new SmokeSessionPage(
            sessionId: sessionId,
            callback: widget.callback,
          );
        },
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        content: new Text("Invalid session code"),
      ));
    }
  }

  Widget sessionCode(String sessionCode) {
    return Padding(padding: EdgeInsets.all(8.0), child: Text('d'));
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  FilteringTextInputFormatter formatter = FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]*'));
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (oldValue.text == newValue.text) {
      return newValue;
    }

    return new TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

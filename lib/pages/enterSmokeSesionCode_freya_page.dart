import 'dart:async';

import 'package:app/app/app.dart';
import 'package:app/components/SmokeSession/smoke_session_carousel.dart';
import 'package:app/main.dart';
import 'package:app/module/module.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/smoke_session_page.dart';
import 'package:app/services/http.service.dart';
import 'package:app/theme/theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class FreyaEnterSmokeSessionCode extends StatefulWidget {
  final GlobalKey<NavigatorState>? Function(int)? callback;

  const FreyaEnterSmokeSessionCode({Key? key, this.callback}) : super(key: key);
  @override
  State<StatefulWidget> createState() => new FreyaEnterSmokeSessionCodeState();
}

class FreyaEnterSmokeSessionCodeState extends State<FreyaEnterSmokeSessionCode> {
  final double topWidgetHeight = 200.0;
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  final ApiClient? apiClient = App.http;
  bool validating = false;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

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
      body: Column(
        children: <Widget>[
          new AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          Expanded(
            flex: 1,
            child: Container(),
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
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
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

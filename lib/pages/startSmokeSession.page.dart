import 'dart:async';

import 'package:app/components/Backgrund.dart';
import 'package:app/components/carousel.dart';
import 'package:app/helpers.dart';
import 'package:app/module/mixology/mixology_bloc.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/smoke_session_page.dart';
import 'package:app/pages/enterSmokeSesionCode.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel/carousel.dart';
import 'package:web_socket_channel/io.dart';

class StartSmokeSessionPage extends StatefulWidget {
  final double topWidgetHeight = 200.0;

  var channel;

  main() async {}

  @override
  StartSmokeSessionPageState createState() {
    main();
    return new StartSmokeSessionPageState();
  }
}

class StartSmokeSessionPageState extends State<StartSmokeSessionPage> {
  Future _openAddEntryDialog(
      BuildContext context, SmokeSessionBloc smokeSessionBloc) async {
    final sessionCode =
        await Navigator.of(context).push(new MaterialPageRoute<String>(
            builder: (BuildContext context) {
              return new EnterSmokeSessionCode();
            },
            fullscreenDialog: true));

    print(sessionCode);
    if (sessionCode == null) {
      return;
    }
    smokeSessionBloc.joinSession(sessionCode);
    Navigator.of(context).push(new MaterialPageRoute(
      builder: (BuildContext context) {
        return new SmokeSessionPage();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    final smokeSessionBloc = DataProvider.getSmokeSession(context);

    return new CupertinoPageScaffold(
      child: Material(
        child: new Stack(
          children: <Widget>[
            new Positioned(
              child: new CircleAvatar(
                  radius: getCircleRadius(context),
                  backgroundColor: Colors.green,
                  child: GestureDetector(
                      onTap: () {
                        _openAddEntryDialog(context, smokeSessionBloc);
                      },
                      child: new Container(
                        child: new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                              'START',
                              style: new TextStyle(
                                  fontSize: 40.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            new Icon(
                              Icons.play_arrow,
                              size: 60.0,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ))),
              left: (MediaQuery.of(context).size.width / 2) -
                  getCircleRadius(context),
              top: widget.topWidgetHeight - getCircleRadius(context),
            ),
            new Positioned(
              child: new Icon(
                Icons.refresh,
                size: 40.0,
              ),
              left: 10.0,
              top: 40.0,
            ),
            new Positioned(
                top: 300.0,
                child: Column(
                  children: <Widget>[
                    Text(
                      'NEAREST PLACE',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green[50]),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2 - 60,
                        child: Carroussel()),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

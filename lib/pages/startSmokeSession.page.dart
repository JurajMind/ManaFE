import 'dart:async';

import 'package:app/app/app.dart';
import 'package:app/components/carousel.dart';
import 'package:app/helpers.dart';
import 'package:app/models/Places/place.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/mixology/mixology_bloc.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/Places/place_detail_page.dart';
import 'package:app/pages/SmokeSession/smoke_session_page.dart';
import 'package:app/pages/enterSmokeSesionCode.page.dart';
import 'package:flutter/material.dart';

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute(
      {WidgetBuilder builder, RouteSettings settings, bool fullscreenDialog})
      : super(
            builder: builder,
            settings: settings,
            fullscreenDialog: fullscreenDialog);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return new FadeTransition(opacity: animation, child: child);
  }
}

class StartSmokeSessionPage extends StatefulWidget {
  final double topWidgetHeight = 200.0;

  StartSmokeSessionPage({this.callback});

  final GlobalKey<NavigatorState> Function(int) callback;

  var channel;
  main() async {}

  @override
  StartSmokeSessionPageState createState() {
    main();
    return new StartSmokeSessionPageState(callback: callback);
  }
}

class StartSmokeSessionPageState extends State<StartSmokeSessionPage> {
  StartSmokeSessionPageState({this.callback});

  final GlobalKey<NavigatorState> Function(int) callback;

  Future _openAddEntryDialog(
      BuildContext context, SmokeSessionBloc smokeSessionBloc) async {
    final sessionCode =
        await Navigator.of(context).push(new MyCustomRoute<String>(
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

  navigateToPlace(Place place) {
    var navigation = callback(1);
    navigation.currentState.push(MaterialPageRoute(
        settings: RouteSettings(),
        builder: (context) => PlaceDetailPage(place: place)));
  }

  @override
  Widget build(BuildContext context) {
    final smokeSessionBloc = DataProvider.getSmokeSession(context);

    return new Container(
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
                  RaisedButton(
                      child: Text('Test'),
                      onPressed: () => App.router.navigateTo(context, 'test')),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2 - 60,
                      child: Carroussel(navigateToDetail: navigateToPlace)),
                ],
              ))
        ],
      ),
    );
  }
}

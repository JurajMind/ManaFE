import 'dart:async';

import 'package:app/components/Common/circle_painter.dart';
import 'package:app/components/carousel.dart';
import 'package:app/Helpers/helpers.dart';
import 'package:app/main.dart';

import 'package:app/module/data_provider.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/Places/place_detail_page.dart';
import 'package:app/pages/SmokeSession/smoke_session_page.dart';
import 'package:app/pages/enterSmokeSesionCode.page.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

import 'Common/relese_notes.dart';

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
    return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    // return new FadeTransition(opacity: animation, child: child);
  }
}

class StartSmokeSessionPage extends StatefulWidget {
  final double topWidgetHeight = 200.0;

  StartSmokeSessionPage({this.callback});

  final GlobalKey<NavigatorState> Function(int) callback;

  @override
  StartSmokeSessionPageState createState() {
    return new StartSmokeSessionPageState(callback: callback);
  }
}

class StartSmokeSessionPageState extends State<StartSmokeSessionPage>
    with SingleTickerProviderStateMixin {
  StartSmokeSessionPageState({this.callback});

  AnimationController _animationController;
  Animation _colorTween;

  final GlobalKey<NavigatorState> Function(int) callback;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 15000));
    _colorTween = ColorTween(begin: Colors.indigo[900], end: Colors.blue)
        .animate(_animationController);
    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
  }

  Future _openAddEntryDialog(
      BuildContext context, SmokeSessionBloc smokeSessionBloc) async {
    final sessionCode =
        await Navigator.of(context).push(new MyCustomRoute<String>(
            builder: (BuildContext context) {
              return new EnterSmokeSessionCode(
                callback: widget.callback,
              );
            },
            fullscreenDialog: false));

    print(sessionCode);
    if (sessionCode == null) {
      return;
    }
    Navigator.of(context).push(new MaterialPageRoute(
      builder: (BuildContext context) {
        return new SmokeSessionPage();
      },
    ));
  }

  navigateToPlace(PlaceSimpleDto place) {
    var navigation = callback(1);
    navigation.currentState.push(MaterialPageRoute(
        settings: RouteSettings(),
        builder: (context) => PlaceDetailPage(place: place)));
  }

  @override
  Widget build(BuildContext context) {
    final smokeSessionBloc = getIt.get<SmokeSessionBloc>();

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: new SafeArea(
        top: false,
        child: Stack(
          children: <Widget>[
            AnimatedBuilder(
              animation: _colorTween,
              builder: (context, child) => CustomPaint(
                  painter: CirclePainter(_colorTween.value,
                      data: MediaQuery.of(context)),
                  child: Container(
                    height: 1000,
                  )),
            ),
            Column(
              children: <Widget>[
                ReleaseNotes(),
                new Expanded(flex: 1, child: Container()),
                new Expanded(
                  flex: 4,
                  child: Hero(
                    tag: 'Circle',
                    child: new Container(
                        child: SizedBox(
                      height: getCircleRadius(context) * 2,
                      width: getCircleRadius(context) * 2,
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
                                  AppTranslations.of(context)
                                      .text('home.start'),
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                new Icon(
                                  Icons.play_arrow,
                                  size: 60.0,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          )),
                    )),
                  ),
                ),
                new Expanded(
                    flex: 4,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 2 - 60,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  AppTranslations.of(context)
                                      .text('home.nearest_place'),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[50]),
                                ),
                                Expanded(
                                    child: Carroussel(
                                        navigateToDetail: navigateToPlace)),
                              ],
                            )),
                      ],
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

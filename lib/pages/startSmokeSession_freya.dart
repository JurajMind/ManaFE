import 'dart:async';

import 'package:app/Helpers/helpers.dart';
import 'package:app/main.dart';

import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/Places/place_detail_page.dart';
import 'package:app/pages/SmokeSession/smoke_session_page.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

import 'Common/relese_notes.dart';
import 'enterSmokeSesionCode_freya_page.dart';

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({required WidgetBuilder builder, RouteSettings? settings, required bool fullscreenDialog})
      : super(builder: builder, settings: settings, fullscreenDialog: fullscreenDialog);

  @override
  Widget buildTransitions(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    // return new FadeTransition(opacity: animation, child: child);
  }
}

class FreyaStartSmokeSessionPage extends StatefulWidget {
  final double topWidgetHeight = 200.0;

  FreyaStartSmokeSessionPage({this.callback});

  final GlobalKey<NavigatorState>? Function(int)? callback;

  @override
  FreyaStartSmokeSessionPageState createState() {
    return new FreyaStartSmokeSessionPageState(callback: callback);
  }
}

class FreyaStartSmokeSessionPageState extends State<FreyaStartSmokeSessionPage> with SingleTickerProviderStateMixin {
  FreyaStartSmokeSessionPageState({this.callback});

  final GlobalKey<NavigatorState>? Function(int)? callback;

  @override
  void initState() {
    super.initState();
  }

  Future _openAddEntryDialog(BuildContext context, SmokeSessionBloc smokeSessionBloc) async {
    final sessionCode = await Navigator.of(context).push(new MyCustomRoute<String>(
        builder: (BuildContext context) {
          return new FreyaEnterSmokeSessionCode(
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
    var navigation = callback!(1)!;
    navigation.currentState!
        .push(MaterialPageRoute(settings: RouteSettings(), builder: (context) => PlaceDetailPage(place: place)));
  }

  @override
  Widget build(BuildContext context) {
    final smokeSessionBloc = getIt.get<SmokeSessionBloc>();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: new SafeArea(
        top: false,
        child: Stack(
          children: <Widget>[
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
                                  AppTranslations.of(context)!.text('home.start'),
                                  style: Theme.of(context).textTheme.displaySmall,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

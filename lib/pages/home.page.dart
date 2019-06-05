import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:app/app/app.dart';
import 'package:app/components/icon_button_title.dart';
import 'package:app/const/theme.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/mixology/mixology_list.dart';
import 'package:app/module/person/person_bloc.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/Gear/gear_page.dart';
import 'package:app/pages/Places/places_page.dart';
import 'package:app/pages/Statistic/statistic_page.dart';
import 'package:app/pages/startSmokeSession.page.dart';
import 'package:app/services/signal_r.dart';
import 'package:app/support/mana_icons_icons.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'SmokeSession/Components/gradiend_color_wheel_rotate.dart';
import 'SmokeSession/smoke_session_page.dart';
import 'Statistic/Detail/smoke_session_detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }
}

//Equivalent to var hc = $.hubConnection(url,options);
final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
StreamSubscription<Flushbar<Map<String, dynamic>>> subscription;

class _HomePageState extends State<HomePage> {
  int _currentIndex = 2;
  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
    4: GlobalKey<NavigatorState>(),
  };

  List<Widget> tabs;
  List<FocusScopeNode> tabFocusNodes;

  SmokeSessionBloc smokeSessionBloc;
  PersonBloc personBloc;

  @override
  void initState() {
    super.initState();
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    _firebaseMessaging.requestNotificationPermissions();
    try {
      _firebaseMessaging.getToken().then((token) async {
        await App.http.updateNotificationToken(token);
      });
    } catch (e) {}
    _firebaseMessaging.configure(onLaunch: (_) {
      print('notification');
    }, onMessage: (msg) {
      print('MSG $msg');
      var title = msg['notification']['title'];
      var body = msg['notification']['body'];
      Flushbar(
        title: title,
        message: body,
        icon: Icon(
          Icons.info_outline,
          size: 28.0,
          color: AppColors.colors[2],
        ),
        duration: Duration(seconds: 10),
        leftBarIndicatorColor: AppColors.colors[2],
      )..show(context);
    });
    tabs = new List<Widget>(5);
    tabFocusNodes = new List<FocusScopeNode>.generate(
      5,
      (int index) => new FocusScopeNode(),
    );
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    smokeSessionBloc = DataProvider.getSmokeSession(context);
    personBloc = DataProvider.getData(context).personBloc;
    subscription = smokeSessionBloc.notifications.stream.listen((data) {
      data.show(context).then((data) {
        if (data == null) return;
        var sessionId = data['sessionId'] as String;
        if (sessionId == null) return;
        navigatorKeys[2].currentState.push(new MaterialPageRoute(
          builder: (BuildContext context) {
            return new SmokeSessionPage(sessionId: sessionId);
          },
        ));
      });
    });
    _focusActiveTab();
    personBloc.loadMyGear(false);
    personBloc.loadInitData();
    SystemChannels.lifecycle.setMessageHandler((msg) {
      debugPrint('SystemChannels> $msg');
      if (msg == AppLifecycleState.paused.toString() ||
          msg == AppLifecycleState.inactive.toString()) {
        var smokeSessionBloc = DataProvider.getData(context).smokeSessionBloc;
        smokeSessionBloc.pauseSession();
      }

      if (msg == AppLifecycleState.resumed.toString()) {
        var signal = new SignalR();
        signal.checkConection();
      }
    });
  }

  @override
  void didUpdateWidget(dynamic oldWidget) {
    super.didUpdateWidget(oldWidget);
    _focusActiveTab();
  }

  void _focusActiveTab() {
    FocusScope.of(context).setFirstFocus(tabFocusNodes[_currentIndex]);
  }

  GlobalKey<NavigatorState> _setActiveTab(int index) {
    if (index == _currentIndex && index == 2) {
      if (!Platform.isIOS) {
        navigatorKeys[index].currentState.maybePop();
      }
    }
    setState(() {
      _currentIndex = index;
      _focusActiveTab();
    });
    return navigatorKeys[index];
  }

  Widget myBottomBar() => new Container(
        child: Material(
          color: new Color.fromARGB(230, 0, 0, 0),
          child: Ink(
            height: 55.0,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: IconButtonTitle(
                      icon: Icon(ManaIcons.leaf),
                      text: AppTranslations.of(context).text("tab_mixology"),
                      color: _currentIndex == 0 ? Colors.white : Colors.grey,
                      tooltip: 'ss',
                      onPressed: () => _setActiveTab(0),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButtonTitle(
                      icon: Icon(Icons.place),
                      text: AppTranslations.of(context).text("tab_places"),
                      color: _currentIndex == 1 ? Colors.white : Colors.grey,
                      onPressed: () => _setActiveTab(1),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 1,
                    child: IconButtonTitle(
                      icon: Icon(ManaIcons.hookah),
                      text: AppTranslations.of(context).text("tab_gear"),
                      color: _currentIndex == 3 ? Colors.white : Colors.grey,
                      onPressed: () => _setActiveTab(3),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButtonTitle(
                      icon: Icon(Icons.person),
                      text: AppTranslations.of(context).text("tab_profile"),
                      color: _currentIndex == 4 ? Colors.white : Colors.grey,
                      onPressed: () => _setActiveTab(4),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (!navigatorKeys[_currentIndex].currentState.canPop()) {
            if (_currentIndex != 2) {
              _setActiveTab(2);
            } else {
              return true;
            }
          } else {
            !await navigatorKeys[_currentIndex].currentState.maybePop();
          }
        },
        child: new SafeArea(
            top: false,
            child: Stack(children: <Widget>[
              _buildBody(),
              Positioned(
                  bottom: -10,
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  child: SizedBox(height: 55, child: myBottomBar())),
              _buildCenter(),
            ])));
  }

  _buildCenter() {
    var centerSize = 70.0;
    return Positioned(
        bottom: 0,
        right: (MediaQuery.of(context).size.width / 2) - centerSize ~/ 2,
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1.0, 6.0),
                  blurRadius: 40.0,
                ),
              ],
            ),
            child: SizedBox(
              height: centerSize,
              width: centerSize,
              child: _currentIndex == 2
                  ? InkWell(
                      borderRadius: BorderRadius.circular(20.0),
                      onTap: () => _setActiveTab(2),
                      child: GradientColorWheelRotate(
                          size: new Size(centerSize, centerSize),
                          defaultColors: [Colors.white, Colors.white],
                          child: Icon(
                            ManaIcons.manam,
                            color: Colors.black,
                          )),
                    )
                  : InkWell(
                      onTap: () => _setActiveTab(2),
                      child: GradientColorWheelRotate(
                          size: new Size(centerSize, centerSize),
                          defaultColors: [Colors.white, Colors.white],
                          child: Icon(
                            ManaIcons.manam,
                            color: Colors.grey,
                          )),
                    ),
            ),
          ),
        ));
  }

  _buildBody() {
    return Material(
      color: Colors.transparent,
      child: new IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          _buildOffstageNavigator(new MixologyList(), 0),
          _buildOffstageNavigator(new PlacesPage(), 1),
          _buildOffstageNavigator(
              new StartSmokeSessionPage(callback: _setActiveTab), 2),
          _buildOffstageNavigator(new GearPage(), 3),
          _buildOffstageNavigator(new StatisticPage(), 4),
        ],
      ),
    );
  }

  @override
  void dispose() {
    for (FocusScopeNode focusScopeNode in tabFocusNodes) {
      focusScopeNode.dispose();
    }
    subscription.cancel();
    super.dispose();
  }

  Widget _buildOffstageNavigator(Widget tabItem, int index) {
    return Offstage(
      offstage: _currentIndex != index,
      child: FocusScope(
        node: tabFocusNodes[index],
        child: TabNavigator(
          navigatorKey: navigatorKeys[index],
          tabItem: tabItem,
        ),
      ),
    );
  }
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget tabItem;

  Map<String, WidgetBuilder> _routeBuilders(
    BuildContext context,
  ) {
    return {
      '/': (context) => this.tabItem,
      '/smokeSesion': (context) {
        return new SmokeSessionPage();
      },
    };
  }

  @override
  Widget build(BuildContext context) {
    var routeBuilders = _routeBuilders(context);
    var observable = HeroController();
    return Navigator(
        key: navigatorKey,
        initialRoute: '/',
        observers: [observable],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
              builder: (context) => routeBuilders[routeSettings.name](context));
        });
  }
}

import 'dart:async';
import 'dart:ui';

import 'package:app/app/app.dart';
import 'package:app/components/icon_button_title.dart';
import 'package:app/const/theme.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/person/person_bloc.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/Statistic/statistic_page.dart';
import 'package:app/pages/startSmokeSession.page.dart';
import 'package:app/services/share.dart';
import 'package:app/services/signal_r.dart';
import 'package:app/support/m_platform.dart';
import 'package:app/support/mana_icons_icons.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:openapi/api.dart';

import 'Gear/gear_scroll_alternative.dart';
import 'Mixology/mixology_list.dart';
import 'Places/places_map_page.dart';
import 'SmokeSession/Components/gradiend_color_wheel_rotate.dart';
import 'SmokeSession/smoke_session_page.dart';
import 'Statistic/Detail/smoke_session_detail_page.dart';

typedef RouteWidgetBuilder = Widget Function(
    BuildContext context, Object argument);

class HomePage extends StatefulWidget {
  final Uri deeplink;

  const HomePage({Key key, this.deeplink}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }
}

final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

StreamSubscription<Flushbar<Map<String, dynamic>>> subscription;

class _HomePageState extends State<HomePage> {
  int _currentIndex = 2;

  final Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
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

  StreamSubscription<int> activeTabSub;
  Stream popNotification;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      smokeSessionBloc = DataProvider.getSmokeSession(context);
      personBloc = DataProvider.getData(context).personBloc;
      personBloc.callback = _setActiveAndJumpTab;

      subscription = smokeSessionBloc.notifications.stream.listen((data) {
        data.show(context).then((data) {
          if (data == null) return;
          var sessionId = data['sessionId'] as String;
          if (sessionId == null) return;
          navigatorKeys[2].currentState.push(new MaterialPageRoute(
            builder: (BuildContext context) {
              return new SmokeSessionPage(
                sessionId: sessionId,
                callback: _setActiveTab,
              );
            },
          ));
        });
      });
    });
    this.initDynamicLinks();

    WidgetsBinding.instance
        .scheduleFrameCallback((_) => firstDeepJump(context));

    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    if (!MPlatform.isWeb) _firebaseMessaging.requestNotificationPermissions();
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

    _focusActiveTab();

    activeTabSub =
        DataProvider.getData(context).appBloc.activeTab.listen((index) {
      _setActiveTab(index);
    });
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

  void initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      final Uri deepLink = dynamicLink?.link;
      print(dynamicLink.toString());

      if (deepLink != null) {
        ShareService.deepLinkNavigation(_setActiveTab, deepLink.path, context);
      }
    }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });
  }

  void firstDeepJump(BuildContext context) {
    if (widget.deeplink != null) {
      ShareService.deepLinkNavigation(
          _setActiveTab, widget.deeplink.path, context);
    }
  }

  void _focusActiveTab() {
    FocusScope.of(context).setFirstFocus(tabFocusNodes[_currentIndex]);
  }

  GlobalKey<NavigatorState> _setActiveTab(int index) {
    if (index == _currentIndex) return navigatorKeys[index];

    DataProvider.getData(navigatorKeys[index].currentContext)
        .appBloc
        .changeActiveTab(index);

    if (index == _currentIndex && index == 2) {
      if (!MPlatform.isIOS) {
        navigatorKeys[index].currentState.maybePop();
      }
    }
    setState(() {
      _currentIndex = index;
      _focusActiveTab();
    });
    return navigatorKeys[index];
  }

  GlobalKey<NavigatorState> _setActiveAndJumpTab(int index, Widget widget) {
    var bc = _setActiveTab(index);
    bc.currentState.push(MaterialPageRoute(builder: (context) => widget));
  }

  Widget myBottomBar(context) => new Container(
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
                      icon: Icon(
                        MPlatform.kIsWeb ? Icons.pie_chart : ManaIcons.leaf,
                      ),
                      text: AppTranslations.of(context).text("tabs.mixology"),
                      color: _currentIndex == 0 ? Colors.white : Colors.grey,
                      tooltip:
                          AppTranslations.of(context).text("tabs.mixology"),
                      onPressed: () => _setActiveTab(0),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButtonTitle(
                      icon: Icon(Icons.place),
                      text: AppTranslations.of(context).text("tabs.places"),
                      color: _currentIndex == 1 ? Colors.white : Colors.grey,
                      onPressed: () => _setActiveTab(1),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 1,
                    child: IconButtonTitle(
                      icon: Icon(
                        MPlatform.kIsWeb ? Icons.settings : ManaIcons.hookah,
                      ),
                      text: AppTranslations.of(context).text("tabs.gear"),
                      color: _currentIndex == 3 ? Colors.white : Colors.grey,
                      onPressed: () => _setActiveTab(3),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButtonTitle(
                      icon: Icon(Icons.person),
                      text: AppTranslations.of(context).text("tabs.profile"),
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
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useTabletLayout = shortestSide > 600;

    return WillPopScope(
        onWillPop: () async {
          if (!navigatorKeys[_currentIndex].currentState.canPop()) {
            if (_currentIndex != 2) {
              _setActiveTab(2);
            } else {
              return true;
            }
          } else {
            await navigatorKeys[_currentIndex].currentState.maybePop();
          }
          return false;
        },
        child: new SafeArea(
            top: false,
            child: Stack(children: <Widget>[
              Material(
                color: Theme.of(context).backgroundColor,
                child: new IndexedStack(
                  index: _currentIndex,
                  children: <Widget>[
                    VisibilityStageNavigator(
                      new MixologyList(),
                      0,
                      currentIndex: _currentIndex,
                      navigatorKeys: navigatorKeys,
                      tabFocusNodes: tabFocusNodes,
                    ),
                    VisibilityStageNavigator(
                      new PlacesMapPage(),
                      1,
                      currentIndex: _currentIndex,
                      navigatorKeys: navigatorKeys,
                      tabFocusNodes: tabFocusNodes,
                    ),
                    VisibilityStageNavigator(
                      new StartSmokeSessionPage(callback: _setActiveTab),
                      2,
                      currentIndex: _currentIndex,
                      navigatorKeys: navigatorKeys,
                      tabFocusNodes: tabFocusNodes,
                    ),
                    VisibilityStageNavigator(
                      new GearScrollAlternativeCross(),
                      3,
                      currentIndex: _currentIndex,
                      navigatorKeys: navigatorKeys,
                      tabFocusNodes: tabFocusNodes,
                    ),
                    VisibilityStageNavigator(
                      new StatisticPage(),
                      4,
                      currentIndex: _currentIndex,
                      navigatorKeys: navigatorKeys,
                      tabFocusNodes: tabFocusNodes,
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: -10,
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  child: SizedBox(
                      height: 55,
                      child: ClipRect(
                        child: BackdropFilter(
                          filter:
                              new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        ),
                      ))),
              useTabletLayout
                  ? Positioned(
                      bottom: -10,
                      height: 55,
                      left: 200,
                      width: MediaQuery.of(context).size.width - 400,
                      child: SizedBox(height: 55, child: myBottomBar(context)))
                  : Positioned(
                      bottom: -10,
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      child: SizedBox(height: 55, child: myBottomBar(context))),
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
                _currentIndex == 2
                    ? BoxShadow(
                        color: Colors.grey,
                        offset:
                            MPlatform.isWeb ? Offset.zero : Offset(1.0, 6.0),
                        blurRadius: MPlatform.isWeb ? 0 : 40.0,
                      )
                    : BoxShadow(
                        color: Colors.grey,
                        offset: Offset.zero,
                        blurRadius: 0,
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
                      borderRadius: BorderRadius.circular(20.0),
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

  @override
  void dispose() {
    for (FocusScopeNode focusScopeNode in tabFocusNodes) {
      focusScopeNode.dispose();
    }
    subscription.cancel();
    activeTabSub.cancel();
    super.dispose();
  }
}


class VisibilityStageNavigator extends StatelessWidget {
  const VisibilityStageNavigator(
    this.child,
    this.index, {
    Key key,
    @required int currentIndex,
    @required this.tabFocusNodes,
    @required this.navigatorKeys,
  }) : super(key: key);

  final List<FocusScopeNode> tabFocusNodes;
  final Map<int, GlobalKey<NavigatorState>> navigatorKeys;
  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      node: tabFocusNodes[index],
      child: TabNavigator(
        navigatorKey: navigatorKeys[index],
        tabItem: child,
        index: index,
      ),
    );
  }
}

class TabNavigator extends StatelessWidget {
  final int index;

  TabNavigator({this.navigatorKey, this.tabItem, this.index});
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget tabItem;

  Map<String, RouteWidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      '/': (context, argument) => this.tabItem,
      '/smokeSesion': (context, argument) {
        return new SmokeSessionPage();
      },
      '/smokeStatistic': (context, argument) {
        if (argument is SmokeSessionSimpleDto) {
          return new SmokeSessioDetailPage(session: argument);
        }
      }
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
              builder: (context) => routeBuilders[routeSettings.name](
                  context, routeSettings.arguments));
        });
  }
}

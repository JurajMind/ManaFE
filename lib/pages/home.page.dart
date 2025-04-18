import 'dart:async';
import 'dart:ui';

import 'package:app/app/app.dart';
import 'package:app/components/icon_button_title.dart';
import 'package:app/const/theme.dart';
import 'package:app/main.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/module.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/Statistic/statistic_page.dart';
import 'package:app/pages/startSmokeSession.page.dart';
import 'package:app/services/share.dart';
import 'package:app/services/signal_r.dart';
import 'package:app/support/m_platform.dart';
import 'package:app/support/mana_icons_icons.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:openapi/openapi.dart';

import 'Gear/gear_scroll_cross.dart';
import 'Mixology/mixology_list.dart';
import 'Places/places_map_page.dart';
import 'SmokeSession/Components/gradiend_color_wheel_rotate.dart';
import 'SmokeSession/smoke_session_page.dart';
import 'Statistic/Detail/smoke_session_detail_page.dart';

typedef RouteWidgetBuilder = Widget? Function(BuildContext context, Object? argument);

class HomePage extends StatefulWidget {
  final Uri? deeplink;
  final RouteObserver<PageRoute>? routeObserver;

  const HomePage({Key? key, this.deeplink, this.routeObserver}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }
}

final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

late StreamSubscription<Flushbar<Map<String, dynamic>>> subscription;

class _HomePageState extends State<HomePage> with RouteAware {
  int _currentIndex = 2;

  final Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
    4: GlobalKey<NavigatorState>(),
  };

  List<Widget?>? tabs;
  List<FocusScopeNode>? tabFocusNodes;

  late SmokeSessionBloc smokeSessionBloc;
  PersonBloc personBloc = getIt.get<PersonBloc>();

  late StreamSubscription<int> activeTabSub;
  Stream? popNotification;

  @override
  void didPush() {}

  @override
  void didPopNext() {
    // Covering route was popped off the navigator.
  }

  @override
  void initState() {
    super.initState();
    var placesBloc = getIt.get<PlacesBloc>()..loadPlaces();
    Future.delayed(Duration.zero, () {
      smokeSessionBloc = getIt.get<SmokeSessionBloc>();
      personBloc.callback = _setActiveAndJumpTab;

      subscription = smokeSessionBloc.notifications.stream.listen((data) {
        data.show(context).then((data) {
          if (data == null) return;
          var sessionId = data['sessionId'] as String?;
          if (sessionId == null) return;
          navigatorKeys[2]!.currentState!.push(new MaterialPageRoute(
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

    WidgetsBinding.instance.scheduleFrameCallback((_) => firstDeepJump(context));

    FirebaseMessaging messaging = FirebaseMessaging.instance;

    messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    //if (!MPlatform.isWeb) _firebaseMessaging.requestNotificationPermissions();
    try {
      messaging.getToken().then((token) async {
        await App.http!.updateNotificationToken(token);
      });
    } catch (e) {}

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        var title = message.notification!.title;
        var body = message.notification!.body;
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
      }
    });

    tabs = <Widget?>[];
    tabFocusNodes = new List<FocusScopeNode>.generate(
      5,
      (int index) => new FocusScopeNode(),
    );
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    _focusActiveTab();

    activeTabSub = DataProvider.getData(context)!.appBloc.activeTab.listen((index) {
      _setActiveTab(index);
    });
    SystemChannels.lifecycle.setMessageHandler((msg) async {
      debugPrint('SystemChannels> $msg');
      if (msg == AppLifecycleState.paused.toString() || msg == AppLifecycleState.inactive.toString()) {
        var smokeSessionBloc = getIt.get<SmokeSessionBloc>();
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
    /*
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
    */
  }

  void firstDeepJump(BuildContext context) {
    if (widget.deeplink != null) {
      ShareService.deepLinkNavigation(_setActiveTab, widget.deeplink!.path, context);
    }
  }

  void _focusActiveTab() {
    // html.window.history.replaceState(null, "test", this.getUrlPrefix());
    //FocusScope.of(context).setFirstFocus(tabFocusNodes[_currentIndex]);
  }

  String getUrlPrefix() {
    if (_currentIndex == 0) {
      return "#/mixology/";
    }
    if (_currentIndex == 1) {
      return "#/places/";
    }

    if (_currentIndex == 2) {
      return "#/session/";
    }

    if (_currentIndex == 3) {
      return "#/gear/";
    }

    if (_currentIndex == 4) {
      return "#/profile/";
    }

    return "#/";
  }

  GlobalKey<NavigatorState>? _setActiveTab(int index) {
    if (index == _currentIndex) return navigatorKeys[index];

    var bloc = DataProvider.getData(navigatorKeys[index]!.currentContext!)!;
    bloc.appBloc.changeActiveTab(index);

    if (index == _currentIndex && index == 2) {
      if (!MPlatform.isIOS) {
        navigatorKeys[index]!.currentState!.maybePop();
      }
    }
    setState(() {
      _currentIndex = index;
      _focusActiveTab();
    });
    return navigatorKeys[index];
  }

  GlobalKey<NavigatorState> _setActiveAndJumpTab(int index, Widget widget) {
    var bc = _setActiveTab(index)!;
    bc.currentState!.push(MaterialPageRoute(builder: (context) => widget));
    return bc;
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
                        MPlatform.isWeb ? Icons.pie_chart : ManaIcons.leaf,
                      ),
                      text: AppTranslations.of(context)!.text("tabs.mixology"),
                      color: _currentIndex == 0 ? Colors.white : Colors.grey,
                      tooltip: AppTranslations.of(context)!.text("tabs.mixology"),
                      onPressed: () => _setActiveTab(0),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButtonTitle(
                      icon: Icon(Icons.place),
                      text: AppTranslations.of(context)!.text("tabs.places"),
                      color: _currentIndex == 1 ? Colors.white : Colors.grey,
                      onPressed: () => _setActiveTab(1),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 1,
                    child: IconButtonTitle(
                      icon: Icon(ManaIcons.hookah),
                      text: AppTranslations.of(context)!.text("tabs.gear"),
                      color: _currentIndex == 3 ? Colors.white : Colors.grey,
                      onPressed: () => _setActiveTab(3),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButtonTitle(
                      icon: Icon(Icons.person),
                      text: AppTranslations.of(context)!.text("tabs.profile"),
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
          if (!navigatorKeys[_currentIndex]!.currentState!.canPop()) {
            if (_currentIndex != 2) {
              _setActiveTab(2);
            } else {
              return true;
            }
          } else {
            await navigatorKeys[_currentIndex]!.currentState!.maybePop();
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
                          filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
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
                        offset: MPlatform.isWeb ? Offset.zero : Offset(1.0, 6.0),
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
    for (FocusScopeNode focusScopeNode in tabFocusNodes!) {
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
    Key? key,
    required int currentIndex,
    required this.tabFocusNodes,
    required this.navigatorKeys,
  }) : super(key: key);

  final List<FocusScopeNode>? tabFocusNodes;
  final Map<int, GlobalKey<NavigatorState>> navigatorKeys;
  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      node: tabFocusNodes![index],
      child: TabNavigator(
        navigatorKey: navigatorKeys[index],
        tabItem: child,
        index: index,
      ),
    );
  }
}

class TabNavigator extends StatelessWidget {
  final int? index;
  final GlobalKey<NavigatorState>? navigatorKey;
  final Widget? tabItem;

  TabNavigator({this.navigatorKey, this.tabItem, this.index});

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
        return null;
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
              builder: (context) => routeBuilders[routeSettings.name!]!(context, routeSettings.arguments)!);
        });
  }
}

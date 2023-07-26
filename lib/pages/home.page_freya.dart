import 'dart:async';
import 'dart:ui';

import 'package:app/app/app.dart';
import 'package:app/const/theme.dart';
import 'package:app/main.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/module.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/Statistic/statistic_page.dart';
import 'package:app/services/share.dart';
import 'package:app/services/signal_r.dart';
import 'package:app/support/m_platform.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openapi/openapi.dart';

import '../components/Buttons/freya_circle_button.dart';
import 'Mixology/mixology_list.dart';

import 'SmokeSession/smoke_session_page.dart';
import 'Statistic/Detail/smoke_session_detail_page.dart';
import 'startSmokeSession_freya.dart';

typedef RouteWidgetBuilder = Widget? Function(BuildContext context, Object? argument);

class FreyaHomePage extends StatefulWidget {
  final Uri? deeplink;
  final RouteObserver<PageRoute>? routeObserver;

  const FreyaHomePage({Key? key, this.deeplink, this.routeObserver}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _FreyaHomePageState();
  }
}

final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

late StreamSubscription<Flushbar<Map<String, dynamic>>> subscription;

class _FreyaHomePageState extends State<FreyaHomePage> with RouteAware {
  int _currentIndex = 1;

  final Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>()
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

    Future.delayed(Duration.zero, () {
      smokeSessionBloc = getIt.get<SmokeSessionBloc>();
      personBloc.callback = _setActiveAndJumpTab;

      subscription = smokeSessionBloc.notifications.stream.listen((data) {
        data.show(context).then((data) {
          if (data == null) return;
          var sessionId = data['sessionId'] as String?;
          if (sessionId == null) return;
          navigatorKeys[1]!.currentState!.push(new MaterialPageRoute(
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
      return null;
    });
  }

  @override
  void didUpdateWidget(dynamic oldWidget) {
    super.didUpdateWidget(oldWidget);
    _focusActiveTab();
  }

  void initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink.listen((PendingDynamicLinkData dynamicLink) async {
      final Uri? deepLink = dynamicLink.link;
      print(dynamicLink.toString());

      if (deepLink != null) {
        ShareService.deepLinkNavigation(_setActiveTab, deepLink.path, context);
      }
    }, onError: (e) async {
      print('onLinkError');
      print(e.message);
    });
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

    if (index == _currentIndex && index == 1) {
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
          color: AppColors.freyaBlack,
          child: Ink(
            height: 55.0,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: FreyaCircleButton(
                      tooltip: AppTranslations.of(context)!.text("tabs.mixology"),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          FontAwesomeIcons.leaf,
                          size: 32,
                        ),
                      ),
                      onPressed: () => _setActiveTab(0),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 1,
                    child: FreyaCircleButton(
                      tooltip: AppTranslations.of(context)!.text("tabs.mixology"),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.person,
                          size: 32,
                        ),
                      ),
                      onPressed: () => _setActiveTab(2),
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
            if (_currentIndex != 1) {
              _setActiveTab(1);
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
            bottom: false,
            child: Stack(children: <Widget>[
              Material(
                color: Theme.of(context).colorScheme.background,
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
                      new FreyaStartSmokeSessionPage(callback: _setActiveTab),
                      1,
                      currentIndex: _currentIndex,
                      navigatorKeys: navigatorKeys,
                      tabFocusNodes: tabFocusNodes,
                    ),
                    VisibilityStageNavigator(
                      new StatisticPage(),
                      2,
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
                      child: BackdropFilter(
                        filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      ))),
              useTabletLayout
                  ? Positioned(
                      bottom: -10,
                      height: 55,
                      left: 200,
                      width: MediaQuery.of(context).size.width - 400,
                      child: SizedBox(height: 55, child: myBottomBar(context)))
                  : Positioned(
                      bottom: 0,
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: SizedBox(height: 55, child: myBottomBar(context))),
              _buildCenter(),
            ])));
  }

  Widget _buildCenter() {
    var centerSize = 70.0;
    return Positioned(
        bottom: 40,
        right: (MediaQuery.of(context).size.width / 2) - centerSize ~/ 2,
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              boxShadow: <BoxShadow>[
                _currentIndex == 1
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
              child: _currentIndex == 1
                  ? InkWell(
                      onTap: () => _setActiveTab(1),
                      child: FreyaCircleButton(
                        onPressed: () {},
                        child: Container(
                          width: 50,
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 3)),
                        ),
                      ))
                  : FreyaCircleButton(
                      tooltip: AppTranslations.of(context)!.text("tabs.mixology"),
                      child: Container(
                        width: 50,
                        decoration:
                            BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 3)),
                      ),
                      onPressed: () => _setActiveTab(1),
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

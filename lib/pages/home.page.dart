import 'dart:io';

import 'package:app/components/icon_button_title.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/mixology/mixology_list.dart';
import 'package:app/module/person/person_bloc.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/Gear/gear.page.dart';
import 'package:app/pages/Places/places.page.dart';
import 'package:app/pages/SmokeSession/gradiend_color_wheel_rotate.dart';
import 'package:app/pages/profile.page.dart';
import 'package:app/pages/startSmokeSession.page.dart';
import 'package:app/support/mana_icons_icons.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }
}

//Equivalent to var hc = $.hubConnection(url,options);
final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

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
    
    tabs = new List<Widget>(5);
    tabFocusNodes = new List<FocusScopeNode>.generate(
      5,
      (int index) => new FocusScopeNode(),
    );

    SystemChannels.lifecycle.setMessageHandler((msg) {
      debugPrint('SystemChannels> $msg');
      if (msg == AppLifecycleState.resumed.toString()) {}
    });
  }



  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    smokeSessionBloc = DataProvider.getSmokeSession(context);
    personBloc = DataProvider.getData(context).personBloc;
    _focusActiveTab();
    personBloc.loadMyGear(false);
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
        navigatorKeys[index].currentState.pop();
      }
    }
    setState(() {
      _currentIndex = index;
      _focusActiveTab();
    });
    return navigatorKeys[index];
  }

  Widget myBottomBar() => new BottomAppBar(
        child: Ink(
          height: 60.0,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButtonTitle(
                  icon: Icon(ManaIcons.leaf),
                  text: AppTranslations.of(context).text("tab_mixology"),
                  color: _currentIndex == 0 ? Colors.white : Colors.grey,
                  tooltip: 'ss',
                  onPressed: () => _setActiveTab(0),
                ),
                IconButtonTitle(
                  icon: Icon(Icons.place),
                  text: AppTranslations.of(context).text("tab_places"),
                  color: _currentIndex == 1 ? Colors.white : Colors.grey,
                  onPressed: () => _setActiveTab(1),
                ),
                _currentIndex == 2
                    ? InkWell(
                        onTap: () => _setActiveTab(2),
                        child: GradientColorWheelRotate(
                            size: new Size(50.0, 50.0),
                            defaultColors: [Colors.white, Colors.white],
                            child: Icon(
                              ManaIcons.manam,
                              color: Colors.black,
                            )),
                      )
                    : InkWell(
                        onTap: () => _setActiveTab(2),
                        child: GradientColorWheelRotate(
                                 size: new Size(50.0, 50.0),
                            defaultColors: [Colors.white, Colors.white],
                            child: Icon(
                              ManaIcons.manam,
                              color: Colors.grey,
                            )),
                      ),
                IconButtonTitle(
                  icon: Icon(ManaIcons.hookah),
                  text: AppTranslations.of(context).text("tab_gear"),
                  color: _currentIndex == 3 ? Colors.white : Colors.grey,
                  onPressed: () => _setActiveTab(3),
                ),
                IconButtonTitle(
                  icon: Icon(Icons.person),
                  text: AppTranslations.of(context).text("tab_profile"),
                  color: _currentIndex == 4 ? Colors.white : Colors.grey,
                  onPressed: () => _setActiveTab(4),
                ),
              ],
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
        child: new Scaffold(
            key: scaffoldKey,
            bottomNavigationBar: myBottomBar(),
            resizeToAvoidBottomPadding: true,
            body: _buildBody()));
  }

  _buildBody() {
    return new IndexedStack(
      index: _currentIndex,
      children: <Widget>[
        _buildOffstageNavigator(new MixologyList(), 0),
        _buildOffstageNavigator(new PlacePage(), 1),
        _buildOffstageNavigator(
            new StartSmokeSessionPage(callback: _setActiveTab), 2),
        _buildOffstageNavigator(new GearPage(), 3),
        _buildOffstageNavigator(new ProfilePage(), 4),
      ],
    );
  }

  @override
  void dispose() {
    for (FocusScopeNode focusScopeNode in tabFocusNodes) {
      focusScopeNode.detach();
    }
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

  void _push(BuildContext context, String route) {
    var routeBuilders = _routeBuilders(context);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => routeBuilders[route](context)));
  }

  Map<String, WidgetBuilder> _routeBuilders(
    BuildContext context,
  ) {
    return {'/': (context) => this.tabItem};
  }

  @override
  Widget build(BuildContext context) {
    var routeBuilders = _routeBuilders(context);

    return Navigator(
        key: navigatorKey,
        initialRoute: '/',
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
              builder: (context) => routeBuilders[routeSettings.name](context));
        });
  }
}

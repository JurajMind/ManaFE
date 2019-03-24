import 'package:app/components/icon_button_title.dart';
import 'package:app/components/my_flutter_app_icons.dart';
import 'package:app/module/mixology/mixology_bloc.dart';
import 'package:app/module/mixology/mixology_list.dart';
import 'package:app/pages/gear.page.dart';
import 'package:app/pages/places.page.dart';
import 'package:app/pages/profile.page.dart';
import 'package:app/pages/startSmokeSession.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }
}

//Equivalent to var hc = $.hubConnection(url,options);

class _HomePageState extends State<HomePage> {
  int _currentIndex = 2;
  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
    4: GlobalKey<NavigatorState>(),
  };

  Widget myBottomBar() => new BottomAppBar(
        child: Ink(
          height: 50.0,
          color: Colors.black,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButtonTitle(
                icon: Icon(Icons.refresh),
                text: 'Mixology',
                color: _currentIndex == 0 ? Colors.white : Colors.grey,
                tooltip: 'ss',
                onPressed: () => setState(() {
                      _currentIndex = 0;
                    }),
              ),
              IconButtonTitle(
                icon: Icon(Icons.place),
                text: 'Places',
                color: _currentIndex == 1 ? Colors.white : Colors.grey,
                onPressed: () => setState(() {
                      _currentIndex = 1;
                    }),
              ),
              IconButton(
                icon: Icon(Icons.settings_backup_restore),
                color: _currentIndex == 2 ? Colors.white : Colors.grey,
                onPressed: () => setState(() {
                      _currentIndex = 2;
                    }),
              ),
              IconButtonTitle(
                icon: Icon(Icons.settings),
                text: 'Gear',
                color: _currentIndex == 3 ? Colors.white : Colors.grey,
                onPressed: () => setState(() {
                      _currentIndex = 3;
                    }),
              ),
              IconButtonTitle(
                icon: Icon(Icons.person),
                text: 'Profile',
                color: _currentIndex == 4 ? Colors.white : Colors.grey,
                onPressed: () => setState(() {
                      _currentIndex = 4;
                    }),
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final smokeSessionBloc = DataProvider.getSmokeSession(context);
    smokeSessionBloc.signalR.conect();
    return new CupertinoTabScaffold(
        tabBar: new CupertinoTabBar(
          backgroundColor: Colors.black,
          activeColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.home),
              title: const Text('Home'),
            ),
            const BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.conversation_bubble),
              title: const Text('Support'),
            ),
            const BottomNavigationBarItem(
                icon: const Icon(
                  CupertinoIcons.profile_circled,
                  size: 50.0,
                ),
                title: const Text('')),
            const BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.profile_circled),
              title: const Text('Profile'),
            ),
            const BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.profile_circled),
              title: const Text('Profile'),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return new DefaultTextStyle(
            style: const TextStyle(
              fontFamily: '.SF UI Text',
              fontSize: 17.0,
              color: CupertinoColors.black,
            ),
            child: new CupertinoTabView(
              builder: (BuildContext context) {
                switch (index) {
                  case 0:
                    return new MixologyList();
                    break;
                  case 1:
                    return new PlacePage();
                    break;
                  case 2:
                    return new StartSmokeSessionPage();
                    break;
                  case 3:
                    return new GearPage();
                    break;
                  case 4:
                    return new ProfilePage();
                    break;
                  default:
                }
              },
            ),
          );
        });
  }

  _buildBody() {
    return new IndexedStack(
      index: _currentIndex,
      children: <Widget>[
        _buildOffstageNavigator(new MixologyList(), 0),
        _buildOffstageNavigator(new PlacePage(), 1),
        _buildOffstageNavigator(new StartSmokeSessionPage(), 2),
        _buildOffstageNavigator(new GearPage(), 3),
        _buildOffstageNavigator(new ProfilePage(), 4),
      ],
    );
  }

  Widget _buildOffstageNavigator(Widget tabItem, int index) {
    return Offstage(
      offstage: _currentIndex != index,
      child: TabNavigator(
        navigatorKey: navigatorKeys[index],
        tabItem: tabItem,
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

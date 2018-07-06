import 'package:app/components/icon_button_title.dart';
import 'package:app/helpers.dart';
import 'package:app/pages/gear.page.dart';
import 'package:app/pages/mixology.page.dart';
import 'package:app/pages/places.page.dart';
import 'package:app/pages/profile.page.dart';
import 'package:app/pages/startSmokeSession.page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }
}

//Equivalent to var hc = $.hubConnection(url,options);

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  Widget myBottomBar() => new BottomAppBar(
        hasNotch: true,
        child: Ink(
          height: 50.0,
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
              Container(
                width: 60.0,
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
    return new Scaffold(
        bottomNavigationBar: myBottomBar(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          elevation: 4.0,
          child: const Icon(Icons.add),
          onPressed: () => setState(() {
                _currentIndex = 2;
              }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: _buildBody());
  }

  _buildBody() {
    return new IndexedStack(
      index: _currentIndex,
      children: <Widget>[
        new MixologyPage(),
        new PlacePage(),
        new StartSmokeSessionPage(),
        new GearPage(),
        new ProfilePage(),
      ],
    );
  }
}

import 'package:app/components/my_flutter_app_icons.dart';
import 'package:app/helpers.dart';
import 'package:app/pages/about.page.dart';
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
  int _currentIndex = 6;

  Widget myBottomBar() => new BottomAppBar(
        hasNotch: true,
        child: Ink(
          height: 50.0,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                FlatButton(
                color: _currentIndex == 0 ? Colors.white:Colors.grey,                
               onPressed: () => setState(() {
                      _currentIndex = 0;
                    }),    
                child: Column( // Replace with a Row for horizontal icon + text
                crossAxisAlignment:CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.refresh),
                    Text("Mixology")
                  ],
                ),
              ),
                FlatButton(
                color: _currentIndex == 1 ? Colors.white:Colors.grey,                
                onPressed: () => setState(() {
                      _currentIndex = 1;
                    }),       
                child: Column( // Replace with a Row for horizontal icon + text
                crossAxisAlignment:CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.refresh),
                    Text("Mixology")
                  ],
                ),
              ),
              Container(
                width: 60.0,
              ),
              IconButton(
                icon: Icon(Icons.settings),
                 color: _currentIndex == 3 ? Colors.white:Colors.grey,
                onPressed: () => setState(() {
                      _currentIndex = 3;
                    }),
              ),
              IconButton(
                icon: Icon(Icons.person),
                color: _currentIndex == 4 ? Colors.white:Colors.grey,
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
          backgroundColor: _currentIndex == 2 ? Colors.white:Colors.grey,
          elevation: 4.0,
          child: Icon(MyFlutterApp.manaIcon),
          onPressed: () {
            setState(() {
                      _currentIndex = 2;
                    });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: _buildBody());
  }

  _buildBody() {
    return new IndexedStack(
      index: _currentIndex,
      children: <Widget>[
        new StartSmokeSessionPage(),
        new StartSmokeSessionPage(),
        new StartSmokeSessionPage(),
        new StartSmokeSessionPage(),
        new StartSmokeSessionPage(),
        new StartSmokeSessionPage(),
      ],
    );
  }
}

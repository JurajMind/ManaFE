import 'package:app/app/app.dart';
import 'package:app/pages/start.page.dart';
import 'package:app/pages/home.page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AppWidgetState();
  }
}

class _AppWidgetState extends State<AppWidget> {

  var userLogin = false;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Manapipes',
      home: userLogin?  new HomePage() : new StartPage(),
      onGenerateRoute: App.router.generator,
      theme: ThemeData(
        fontFamily: 'Montserrat',
          canvasColor: Colors.black,
          primaryColor: Colors.white
      )
      
      ,
    );
  }
}
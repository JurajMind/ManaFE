import 'package:flutter/material.dart';

class AppBarContainer extends StatefulWidget{
  
  Widget child;
  PreferredSizeWidget appBar;
  AppBarContainer({this.child,this.appBar});

  @override
  AppBarContainerState createState() {
    return new AppBarContainerState();
  }
}

class AppBarContainerState extends State<AppBarContainer> {
  @override
  Widget build(BuildContext context) {
   return new Container(
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            new Icon(Icons.exit_to_app)
          ],
        )
      ],
    )
  }
}
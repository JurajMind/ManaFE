import 'package:flutter/material.dart';

class AppBarContainer extends StatelessWidget{
  
  Widget child;
  PreferredSizeWidget appBar;
  AppBarContainer({this.child,this.appBar});
  

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
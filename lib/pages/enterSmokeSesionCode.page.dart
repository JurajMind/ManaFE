import 'package:app/helpers.dart';
import 'package:flutter/material.dart';

class EnterSmokeSessionCode extends StatelessWidget {

  final double topWidgetHeight = 200.0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
       
      ),
      body: Stack(
        children: <Widget>[
          new Positioned(
            child: CircleAvatar(
              radius: getCircleRadius(context),
              backgroundColor: Colors.red,
              child: Center(
                widthFactor: 0.4,
                child: TextField(),
              ),
            ),
             left: (MediaQuery.of(context).size.width / 2) - getCircleRadius(context),
            top: topWidgetHeight - getCircleRadius(context),
          )
        ],
      )
    );
  }
}

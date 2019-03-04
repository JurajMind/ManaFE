import 'dart:math';

import 'package:app/Helpers/helpers.dart';
import 'package:app/pages/SmokeSession/flip.dart';

import 'package:flutter/material.dart';

class AnimationSelectPage extends StatefulWidget {
  @override
  AnimationSelectState createState() {
    return new AnimationSelectState();
  }
}

class AnimationSelectState extends State<AnimationSelectPage> {
  final generatedList = List.generate(40, (index) => 'Item $index');
  final List<Color> circleColors = List.generate(
      360, (index) => HSVColor.fromAHSV(1.0, index + 0.0, 1.0, 1.0).toColor());
  Color randomGenerator() {
    return circleColors[new Random().nextInt(360)];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          child: CustomScrollView(
            controller: new ScrollController(initialScrollOffset: 0.0),
            reverse: false,
            slivers: <Widget>[
              new SliverCurvedExtentList(
                curve: ReverseCurve(),
                delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(getCircleRadius(context) * 2),
                        color: randomGenerator()),
                    child: Center(
                      child: new Text(index.toString()),
                    ),
                  );
                }, childCount: generatedList.length),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ReverseCurve extends Curve {
  const ReverseCurve();

  @override
  double transform(double t) {
    assert(t >= 0.0 && t <= 1.0);
    return -(0.4);
  }

  @override
  String toString() {
    var period;
    return '$runtimeType($period)';
  }
}

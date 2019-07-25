import 'package:flutter/material.dart';

class DistanceWidget extends StatelessWidget {
  final double distance;

  const DistanceWidget(this.distance, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (distance == null) {
      return Container();
    }

    String text;
    if (distance < 1) {
      text = "${(distance * 1000).toStringAsFixed(1)} m";
    } else {
      text = "${(distance).toStringAsFixed(1)} km";
    }

    return Container(
      child: Text(text),
    );
  }
}

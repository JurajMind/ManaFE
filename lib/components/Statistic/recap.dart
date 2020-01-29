import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tuple/tuple.dart';

class StatisticRecapWidget extends StatelessWidget {
  final Color ballColor;
  final String label;
  final String value;
  final Duration duration;

  const StatisticRecapWidget({
    Key key,
    this.ballColor,
    this.label,
    this.value,
    this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lines = timeDuration();
    return Container(
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        direction: Axis.vertical,
        children: <Widget>[
          Flex(direction: Axis.horizontal, mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(shape: BoxShape.circle, color: ballColor),
            ),
            Text(' ${label?.toUpperCase()}', style: Theme.of(context).textTheme.bodyText2)
          ]),
          buildSecondLine(lines, context),
          buildThirdLine(lines, context)
        ],
      ),
    );
  }

  Widget buildSecondLine(Tuple2<String, String> lines, BuildContext context) {
    if (value == null && duration == null)
      return Shimmer.fromColors(
        baseColor: Colors.grey[400],
        highlightColor: Colors.white,
        child: Text(' Loading', style: Theme.of(context).textTheme.headline6),
      );

    if (duration == null) return Text(' $value', style: Theme.of(context).textTheme.headline6);

    return Text(lines.item1, style: Theme.of(context).textTheme.bodyText1);
  }

  Widget buildThirdLine(Tuple2<String, String> lines, BuildContext context) {
    if (value == null && duration == null) return Container(height: 16);

    if (duration == null) return Container(height: 16);

    return Text(lines.item2, style: Theme.of(context).textTheme.bodyText2);
  }

  Tuple2<String, String> timeDuration() {
    if (duration == null) return null;
    if (duration.inDays > 0) {
      var first = " ${duration.inDays.toString()} days";
      var second = " ${(duration.inHours % 24).toString()} hours";
      return new Tuple2(first, second);
    } else {
      var first = " ${(duration.inHours % 60).toString()} hours";
      var second = " ${(duration.inMinutes % 60).toString()} minutes";
      return new Tuple2(first, second);
    }
  }
}

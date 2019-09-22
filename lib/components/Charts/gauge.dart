import 'dart:math';

/// Gauge chart example, where the data does not cover a full revolution in the
/// chart.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class GaugeChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  final double value;
  final int maxValue;
  final int minValue;
  final Color handColor;

  GaugeChart(this.seriesList,
      {this.animate, this.value, this.maxValue, this.minValue, this.handColor});

  /// Creates a [PieChart] with sample data and no transition.
  factory GaugeChart.withSampleData() {
    return new GaugeChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    var paint = new Paint();
    paint.color = handColor ?? Colors.black87;
    paint.style = PaintingStyle.fill;

    return Stack(
      children: <Widget>[
        new charts.PieChart(seriesList,
            animate: animate,
            // Configure the width of the pie slices to 30px. The remaining space in
            // the chart will be left as a hole in the center. Adjust the start
            // angle and the arc length of the pie so it resembles a gauge.
            defaultRenderer: new charts.ArcRendererConfig(
                arcWidth: 30, startAngle: 4 / 5 * pi, arcLength: 7 / 5 * pi)),
        Positioned.fill(
          child: Align(
              alignment: Alignment.center,
              child: new CustomPaint(
                size: new Size(200, 200),
                foregroundPainter: new HandPainter(
                    min: minValue,
                    max: maxValue,
                    value: value,
                    hourHandPaint: paint),
              )),
        ),
        Positioned.fill(
          child: Align(
              alignment: Alignment.center,
              child: Text(
                "$value/$maxValue",
                style: Theme.of(context).textTheme.body2,
              )),
        ),
      ],
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<GaugeSegment, String>> _createSampleData() {
    final data = [
      new GaugeSegment('Low', 75),
      new GaugeSegment('Acceptable', 100),
      new GaugeSegment('High', 50),
      new GaugeSegment('Highly Unusual', 5),
    ];

    return [
      new charts.Series<GaugeSegment, String>(
        id: 'Segments',
        domainFn: (GaugeSegment segment, _) => segment.segment,
        measureFn: (GaugeSegment segment, _) => segment.size,
        areaColorFn: (GaugeSegment segment, _) => charts.Color(r: segment.size),
        data: data,
      )
    ];
  }
}

/// Sample data type.
class GaugeSegment {
  final String segment;
  final int size;

  GaugeSegment(this.segment, this.size);
}

class HandPainter extends CustomPainter {
  static const minAngel = -0.7;
  static const maxAngel = 0.7;
  final Paint hourHandPaint;
  int min;
  int max;
  double value;

  HandPainter({this.min, this.max, this.value, this.hourHandPaint});

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    // To draw hour hand
    canvas.save();

    canvas.translate(radius, radius);
    if (value > 0) {
      var angel = minAngel + ((1.4) / ((max - min)) * value);
      canvas.rotate(1 * pi * (angel));
    } else {
      canvas.rotate(1 * pi * minAngel);
    }

    Path path = new Path();

    //hour hand stem
    path.moveTo(-1.0, -radius + radius / 4);
    path.lineTo(-5.0, -radius + radius / 2);
    path.lineTo(-2.0, 0.0);
    path.lineTo(2.0, 0.0);
    path.lineTo(5.0, -radius + radius / 2);
    path.lineTo(1.0, -radius + radius / 4);
    path.close();

    canvas.drawPath(path, hourHandPaint);
    canvas.drawShadow(path, Colors.black, 2.0, false);

    canvas.restore();
  }

  @override
  bool shouldRepaint(HandPainter oldDelegate) {
    return true;
  }
}

import 'package:flutter/material.dart';

class BgPainter extends CustomPainter {
  final Color? color;
  final Offset startPoint;

  static const List<Offset> logoPoints = [
    Offset(-120.546, 76.496),
    Offset(-118.296, 93.169),
    Offset(-116.047, 109.842),
    Offset(-113.798, 126.515),
    Offset(-111.549, 143.188),
    Offset(-109.3, 159.861),
    Offset(-107.051, 176.534),
    Offset(-104.802, 193.207),
    Offset(-102.552, 209.879),
    Offset(-100.303, 226.552),
    Offset(-79.016, 226.405),
    Offset(-57.729, 226.258),
    Offset(-36.442, 226.11),
    Offset(-15.155, 225.963),
    Offset(6.132, 225.816),
    Offset(27.419, 225.668),
    Offset(48.706, 225.521),
    Offset(69.993, 225.374),
    Offset(91.28, 225.226),
    Offset(95.249, 208.027),
    Offset(99.219, 190.828),
    Offset(103.188, 173.629),
    Offset(107.157, 156.429),
    Offset(111.126, 139.23),
    Offset(115.095, 122.031),
    Offset(119.064, 104.832),
    Offset(123.034, 87.633),
    Offset(127.003, 70.433),
    Offset(112.891, 62.607),
    Offset(98.78, 54.781),
    Offset(84.668, 46.955),
    Offset(70.557, 39.129),
    Offset(56.446, 31.303),
    Offset(42.334, 23.477),
    Offset(28.223, 15.651),
    Offset(14.111, 7.825),
    Offset(0, 0),
  ];

  var hueRotation;

  BgPainter(
      {this.color = const Color(0xFF1F03FF),
      this.logoSize = 0.4,
      this.hueRotation = 1.5,
      this.startPoint = const Offset(200, 200)});
  final logoSize;
  static const _diameter = 307;
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();
    paint.color = color!;

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));

    var index = 0;

    var hsv = HSLColor.fromColor(paint.color);
    var starthue = (hsv.hue + (hueRotation * logoPoints.length)) % 360;
    hsv = HSLColor.fromAHSL(hsv.alpha, starthue, hsv.saturation, 1);
    for (var point in logoPoints) {
      var offsetPoint = new Offset(startPoint.dx + (point.dx * logoSize),
          startPoint.dy + (point.dy * logoSize));

      var rotated = HSVColor.fromAHSV(
          hsv.alpha,
          ((hsv.hue - (hueRotation * index)) % 360),
          hsv.saturation,
          hsv.lightness);
      paint.color = rotated.toColor();
      canvas.drawCircle(offsetPoint, _diameter * logoSize as double, paint);
      index++;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

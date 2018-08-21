import 'package:flutter/material.dart';
import 'dart:math' as math;

class ColorHelper {
  static double distance(Offset position) {
    var distance =
        math.sqrt(position.dx * position.dx + position.dy * position.dy);
    return distance;
  }

  static Offset positionToCenter(Offset offset, Offset middle) {
    return new Offset(middle.dx - offset.dx, middle.dy - offset.dy);
  }

  static double xy2polar(x, y) {
    var phi = math.atan2(y, x);
    return phi;
  }

  static doublerad2deg(double rad) {
    return (((rad * 180) / (math.pi)));
  }

  static HSVColor position2color(Offset offset, double size) {
    var radius = distance(offset) / size;

    var color = xy2polar(offset.dx, offset.dy);

    return HSVColor.fromAHSV(1.0, doublerad2deg(color), radius, 1.0);
  }

  static Offset getOffsetFromColor(HSVColor color, double width) {
    return Offset.zero;
  }

  static Color getOpositeColor(Color color){
    var hsv  = HSVColor.fromColor(color);
    return HSVColor.fromAHSV(1.0, hsv.hue + 180 , hsv.saturation, 1.0).toColor();
  }

  static List<Color> GetRandomColors(int count){
    var random = new math.Random();
    var intitColor = random.nextInt(360);
    return List<Color>.generate(count, (int index) => new HSVColor.fromAHSV(1.0, intitColor + index * 360/count, 1.0, 1.0).toColor());
  }
}

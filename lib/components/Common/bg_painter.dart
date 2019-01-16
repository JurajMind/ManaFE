

import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

class BgPainter extends CustomPainter {

final Color color;

  BgPainter({this.color = Colors.orange});

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();
    paint.color = color;


    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
 
    Offset startPoint = new Offset(size.width/2, 0);
    for (var i = 0; i < 3; i++){
      var moveX = 50.0 * i;
      var moveY = 50.0*i;
      startPoint = new Offset(startPoint.dx + moveX, startPoint.dy + moveY);

      canvas.drawCircle(startPoint, 50, paint);
      var color = TinyColor(paint.color).darken(3);
      paint.color = color.color;
    }

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
  }
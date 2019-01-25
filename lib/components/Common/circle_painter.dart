import 'package:app/components/Common/bg_painter.dart';
import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final Color color;
  BgPainter bgPainter;

  CirclePainter(this.color) {
    this.bgPainter = new BgPainter(color: this.color, logoSize: 0.6);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = color;
    canvas.clipRect(Rect.fromCircle(
      center: Offset(size.width / 2, size.height * 0.3),
      radius: size.width * 1,
    ));
    this.bgPainter.paint(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

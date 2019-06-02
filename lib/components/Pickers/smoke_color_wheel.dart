import 'dart:ui';

import 'package:app/utils/color.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class SmokeColorWheel extends StatefulWidget {
  final HSVColor color;
  final ValueChanged<HSVColor> onColorChanged;
  const SmokeColorWheel({Key key, this.color, this.onColorChanged})
      : super(key: key);

  @override
  SmokeColorWheelState createState() {
    return new SmokeColorWheelState();
  }
}

class SmokeColorWheelState extends State<SmokeColorWheel> {
  HSVColor selectedColor;
  Offset position;

  @override
  void initState() {
    debugPrint('color ${widget.color}');
    selectedColor =
        widget.color != null ? widget.color : HSVColor.fromColor(Colors.white);
    super.initState();
  }

  @override
  void didUpdateWidget(SmokeColorWheel oldWidget) {
    if (oldWidget.color != widget.color) {
      selectedColor = widget.color != null
          ? widget.color
          : HSVColor.fromColor(Colors.white);
      Size size = MediaQuery.of(context).size;
      position = ColorHelper.colorToPosition(selectedColor, size, position);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        height: 400,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                onTapDown: (d) => print('tap'),
                onTapUp: (TapUpDetails details) {
                  RenderBox getBox = context.findRenderObject();
                  Offset localOffset =
                      getBox.globalToLocal(details.globalPosition);
                  colorUpdate(localOffset, size);

                  widget.onColorChanged(selectedColor);
                },
                onPanUpdate: (DragUpdateDetails details) {
                  RenderBox getBox = context.findRenderObject();
                  Offset localOffset =
                      getBox.globalToLocal(details.globalPosition);
                  colorUpdate(localOffset, size);
                },
                onPanEnd: (DragEndDetails details) {
                  widget.onColorChanged(selectedColor);
                },
                child: RepaintBoundary(
                  child: Transform.rotate(
                    angle: 0.2,
                    child: new Container(
                      decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: AssetImage("images/color_wheel.png"),
                              fit: BoxFit.fill),
                          borderRadius:
                              new BorderRadius.all(Radius.circular(width / 2)),
                          border: new Border.all(
                              color: const Color.fromRGBO(221, 221, 221, 1.0),
                              width: 2.5)),
                    ),
                  ),
                ),
              ),
            ),
            new ColorCircle(globalOffset: position, color: selectedColor),
          ],
        ),
      ),
    );
  }

  void colorUpdate(Offset localOffset, Size size) {
    var middle = ColorHelper.positionToCenter(
        localOffset, Offset(size.width / 2, size.width / 2));
    var radius = ColorHelper.distance(middle) / (size.width / 2);
    print(radius);
    if (radius > 1) return;
    setState(() {
      position = localOffset;
      selectedColor = ColorHelper.position2color(middle, size.width / 2);
    });
  }
}

class ColorCircle extends StatelessWidget {
  const ColorCircle({
    Key key,
    @required this.globalOffset,
    this.color,
  }) : super(key: key);

  final Offset globalOffset;
  final HSVColor color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: this.globalOffset?.dy ?? 0.0 - 20,
      left: this.globalOffset?.dx ?? 0.0 - 20,
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
            color: color.toColor(),
            borderRadius: new BorderRadius.all(Radius.circular(25.0)),
            border: new Border.all(
                color: const Color.fromRGBO(221, 221, 221, 1.0), width: 4.0)),
      ),
    );
  }
}

class RainbowPainter extends CustomPainter {
  bool inCircle(Offset offset, Offset middle) {
    return ColorHelper.distance(offset) >= middle.dx;
  }

  RainbowPainter({this.pick});

  Offset pick;

  @override
  void paint(Canvas canvas, Size size) {
    print('paint');
    var middle = Offset(size.width / 2, size.height / 2);
    for (int x = 0; x < size.width; x++) {
      for (int y = 0; y < size.width; y++) {
        var position = new Offset(x + 0.0, y + 0.0);
        var positionToMiddle = ColorHelper.positionToCenter(position, middle);
        if (inCircle(positionToMiddle, middle)) {
          continue;
        }

        var paint = Paint()
          ..color =
              ColorHelper.position2color(positionToMiddle, middle.dx).toColor()
          ..strokeWidth = 2.0
          ..style = PaintingStyle.stroke;
        canvas.drawPoints(PointMode.points, [position], paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CircleGradientPainter extends CustomPainter {
  bool inCircle(Offset offset, Offset middle) {
    return ColorHelper.distance(offset) >= middle.dx;
  }

  double fromHue = 40.0;
  double toHue = 250.0;

  CircleGradientPainter();

  @override
  void paint(Canvas canvas, Size size) {
    print('paint');
    var middle = Offset(size.width / 2, size.height / 2);
    for (int x = 0; x < size.width; x++) {
      for (int y = 0; y < size.width; y++) {
        var position = new Offset(x + 0.0, y + 0.0);
        var positionToMiddle = ColorHelper.positionToCenter(position, middle);
        if (inCircle(positionToMiddle, middle)) {
          continue;
        }

        var paint = Paint()
          ..color = _getColor(positionToMiddle, middle.dx)
          ..strokeWidth = 2.0
          ..style = PaintingStyle.stroke;
        canvas.drawPoints(PointMode.points, [position], paint);
      }
    }
  }

  Color _getColor(Offset offset, double size) {
    var color = ColorHelper.xy2polar(offset.dx, offset.dy);
    var angle = ColorHelper.doublerad2deg(color);
    double s = 0.0;
    var step = (this.toHue - fromHue) / 180;
    if (angle > 0) {
      s = this.fromHue + step * angle;
    } else {
      s = this.fromHue - step * angle;
    }

    return HSVColor.fromAHSV(1.0, s, 1.0, 1.0).toColor();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

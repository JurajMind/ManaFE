import 'package:flutter/cupertino.dart';
import 'dart:math' as math;
import 'package:tuple/tuple.dart';
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
  Color selectedColor;
  Offset position;

  @override
  void initState() {
    selectedColor = Colors.white;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    position =
        _getOffsetFromColor(widget.color, MediaQuery.of(context).size.width);
    super.didChangeDependencies();
  }

  Offset _getOffsetFromColor(HSVColor color, double size) {
    var angle = 180 + color.hue - 90;
    print(angle);
    var distance = color.saturation * (size / 2);
    var dy = math.sin(angle / (math.pi / 180)) * distance;
    var dx = math.cos(angle / (math.pi / 180)) * distance;
    return new Offset(dx, size + dy);
  }

  HSVColor _colorFromPosition(Offset position) {
    var dx = position.dx;
    var dy = position.dy;

    var phi = math.atan2(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Stack(
        children: <Widget>[
          Center(
            child: GestureDetector(
              onTapUp: (TapUpDetails details) {
                RenderBox getBox = context.findRenderObject();
                Offset localOffset =
                    getBox.globalToLocal(details.globalPosition);
                setState(() {
                  this.position = localOffset;
                  var hsvColor = _position2color(localOffset, size);
                  widget.onColorChanged(hsvColor);
                  this.selectedColor = hsvColor.toColor();
                });
              },
              onPanUpdate: (DragUpdateDetails details) {
                RenderBox getBox = context.findRenderObject();
                Offset localOffset =
                    getBox.globalToLocal(details.globalPosition);
                setState(() {
                  this.position = localOffset;
                });
              },
              child: new Container(
                height: width - 10,
                width: width - 10,
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
          Positioned(
            top: position.dy - 16,
            left: position.dx - 16,
            child: colorPickerCircle(this.selectedColor),
          )
        ],
      ),
    );
  }

  Offset _absoluteToRelative(Offset offset, Size size) {
    return new Offset(offset.dx - (size.width + 16) / 2,
        (offset.dy - (0.25 * size.height + size.width / 2 - 16)) * -1);
  }

  Widget colorPickerCircle(Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50.0,
        width: 50.0,
        child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: new BorderRadius.all(Radius.circular(25.0)),
              border: new Border.all(
                  color: const Color.fromRGBO(221, 221, 221, 1.0), width: 4.0)),
        ),
      ),
    );
  }
}

HSVColor _position2color(Offset localOffset, Size size) {
  var radius = (size.width - 40) / 2;
  var circleOffset = new Offset((localOffset.dx - size.width / 2) / radius,
      ((localOffset.dy - size.width / 2) * -1) / radius);
  print("x:${circleOffset.dx},y:${circleOffset.dy}");
  var color = xy2polar(circleOffset.dx, circleOffset.dy);

  return HSVColor.fromAHSV(1.0, doublerad2deg(color.item2), color.item1, 1.0);
}

Tuple2<double, double> xy2polar(x, y) {
  var r = math.sqrt(x * x + y * y);
  var phi = math.atan2(y, x);
  return new Tuple2(r, phi);
}

doublerad2deg(double rad) {
  return ((rad + math.pi) / (2 * math.pi)) * 360;
}

import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
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
  HSVColor selectedColor;
  Offset position;
  

  @override
  void initState() {
    selectedColor = HSVColor.fromColor(Colors.white);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    position = ColorHelper._getOffsetFromColor(
        widget.color, MediaQuery.of(context).size.width);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Container(
          child: GestureDetector(
            onTapUp: (TapUpDetails details) {
              RenderBox getBox = context.findRenderObject();
              Offset localOffset = getBox.globalToLocal(details.globalPosition);
              var middle = ColorHelper.positionToCenter(localOffset,Offset(size.width / 2, size.height / 2));
                            setState(() {
              position = localOffset;
              selectedColor = ColorHelper._position2color(middle, size.width);                
                            });
              
              //widget.onColorChanged(selectedColor);
            },
            onPanUpdate: (DragUpdateDetails details) {
              RenderBox getBox = context.findRenderObject();
              Offset localOffset = getBox.globalToLocal(details.globalPosition);
              setState(() {
              position = localOffset;
              selectedColor = ColorHelper._position2color(localOffset, size.width);                
                            });

            },
            onPanEnd: (DragEndDetails details) {              
            widget.onColorChanged(selectedColor);
            },
            child: new Container(
              child: RepaintBoundary(
                child: ClipOval(
                  
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                          height:size.height*2,
                                          top: -size.height,
                                          left:-size.height,
                                          width: size.height*2,
                                        child: Transform.rotate(
                                          angle: 50.0,
                                                                                  child: CustomPaint(
                    
                    painter: CircleGradientPainter(),
                  ),
                                        ),
                                        ),
                                    ],
                                  ),
                ),
              ),
              decoration: new BoxDecoration(
                  borderRadius:
                      new BorderRadius.all(Radius.circular(width / 2)),
                  border: new Border.all(
                      color: const Color.fromRGBO(221, 221, 221, 1.0),
                      width: 2.5)),
            ),
          ),
        ),
        new ColorCircle(globalOffset:position,color: selectedColor)
      ],
    );
  }
}

class ColorCircle extends StatelessWidget {
  const ColorCircle({
    Key key,
    @required this.globalOffset, this.color,
  }) : super(key: key);

  final Offset globalOffset;
  final HSVColor color;

  @override
  Widget build(BuildContext context) {
           return Positioned(
          top: this.globalOffset.dy,
          left: this.globalOffset.dx,
          child: Container(
            width: 50.0,
            height: 50.0,           
            decoration: BoxDecoration(
               color: color.toColor(),
                borderRadius: new BorderRadius.all(Radius.circular(25.0)),
                border: new Border.all(
                    color: const Color.fromRGBO(221, 221, 221, 1.0),
                    width: 4.0)),
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
              ColorHelper._position2color(positionToMiddle, middle.dx).toColor()
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
          ..color =
             _getColor(positionToMiddle, middle.dx)
          ..strokeWidth = 2.0
          ..style = PaintingStyle.stroke;
        canvas.drawPoints(PointMode.points, [position], paint);
      }
    }
  }

  Color _getColor(Offset offset,double size){    

    var color = ColorHelper.xy2polar(offset.dx, offset.dy);
    var angle = ColorHelper.doublerad2deg(color);
    double s = 0.0;
    var step = (this.toHue - fromHue) / 180;
    if(angle > 0)
    {
       s  = this.fromHue + step * angle;
    }else{
       s  = this.fromHue - step * angle;
    }
    

    return HSVColor.fromAHSV(1.0, s, 1.0, 1.0).toColor();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}



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

  static HSVColor _position2color(Offset offset, double size) {
    var radius = distance(offset) / size;

    var color = xy2polar(offset.dx, offset.dy);

    return HSVColor.fromAHSV(1.0, doublerad2deg(color), radius, 1.0);
  }



  static Offset _getOffsetFromColor(HSVColor color, double width) {
    return Offset.zero;
  }
}

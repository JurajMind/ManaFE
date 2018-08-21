import 'dart:ui';

import 'package:app/module/data_provider.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/smoke_rotaion.dart';
import 'package:app/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientColorWheel extends StatefulWidget {
  const GradientColorWheel({key, this.defaultColors,this.child,this.size}) : super(key: key);  
  @required
  final List<Color> defaultColors;
  final Widget child;
  final Size size;
  @override
  GradientColorWheelState createState() {
    return new GradientColorWheelState();
  }
}

class GradientColorWheelState extends State<GradientColorWheel> {
  
  Offset position;

  @override
  void initState() {    
    super.initState();
  }

    StreamBuilder<List<Color>> buildCircle(SmokeSessionBloc smokeSessionBloc,Size size) {
    return StreamBuilder<List<Color>>(
      stream: smokeSessionBloc.sessionColor,
      initialData: widget.defaultColors,
      builder: (context, snapshot) => Container(
                            height: size.height,
                            width: size.height,
                            child: widget.child,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: snapshot.data != null ? snapshot.data : widget.defaultColors))),
    );
  }

  @override
  Widget build(BuildContext context) {

    final smokeSessionBloc = DataProvider.getSmokeSession(context);

    Size size = widget.size == null? MediaQuery.of(context).size : widget.size;
    double width = MediaQuery.of(context).size.width;    
    return Stack(
      children: <Widget>[
        Container(
          child: new Container(
            child: ClipOval(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: SmokeRotation(
                      child: RepaintBoundary(
                        child: buildCircle(smokeSessionBloc,size)
                      ),
                    ),
                  ),
                ],
              ),
            ),
            decoration: new BoxDecoration(
                borderRadius: new BorderRadius.all(Radius.circular(width / 2)),
                border: new Border.all(
                    color: const Color.fromRGBO(221, 221, 221, 1.0),
                    width: 2.5)),
          ),
        ),
      ],
    );
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

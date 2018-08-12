import 'package:flutter/cupertino.dart';

class SmokeColorWheel extends StatefulWidget {
  const SmokeColorWheel({
    Key key,
  }) : super(key: key);

  @override
  SmokeColorWheelState createState() {
    return new SmokeColorWheelState();
  }
}

class SmokeColorWheelState extends State<SmokeColorWheel> {
  List<Color> rainbow;
  Offset position = new Offset(100.0, 100.0);

  @override
  void initState() {
    rainbow = new List<Color>.generate(
        255,
        (int index) => HSVColor
            .fromAHSV(index + .0, 255.0, index + .0, index + .0)
            .toColor()); // [0, 1, 4]

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Stack(children: <Widget>[
        Center(
          child: new Container(
            height: width - 10,
            width: width - 10,
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: AssetImage("images/color_wheel.png"),
                    fit: BoxFit.fill),
                borderRadius: new BorderRadius.all(Radius.circular(width / 2)),
                border: new Border.all(
                    color: const Color.fromRGBO(221, 221, 221, 1.0),
                    width: 2.5)),
          ),
        ),
        new Positioned(
          top: position.dy,
          left: position.dx,
          child: Draggable(
            feedback: Container(
              child: colorPickerCircle(),
            ),
            onDraggableCanceled: (velocity, offset) {
              setState(() => position = offset);
            },
            childWhenDragging: Container(),
            child: colorPickerCircle(),
          ),
        )
      ]),
    );
  }

  SizedBox colorPickerCircle() {
    return SizedBox(
      height: 50.0,
      width: 50.0,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: new BorderRadius.all(Radius.circular(25.0)),
            border: new Border.all(
                color: const Color.fromRGBO(221, 221, 221, 1.0), width: 4.0)),
      ),
    );
  }
}

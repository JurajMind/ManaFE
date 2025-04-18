import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {

  final Color? color;
  final String? text;
  final bool? isSquare;
  final double size;
  final Color textColor;

  const Indicator({
    Key? key,
    this.color,
    this.text,
    this.isSquare,
    this.size = 16,
    this.textColor = Colors.white
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare! ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          text!,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
        )
      ],
    );
  }

}
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  Color _mainColor = Colors.red;
  Color _secondColor = Colors.blue;

  List<Color> get colors => [_mainColor,_secondColor];

  void setColor(Color color){
    _mainColor = color;
    var h = HSVColor.fromColor(color);
    _secondColor = HSVColor.fromAHSV(1.0, h.hue + 180.0 , h.saturation, 1.0).toColor();
  }
}


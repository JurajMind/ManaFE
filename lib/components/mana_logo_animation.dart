import 'dart:ui';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/src/rendering/object.dart';

class LogoCircle { 
  Offset position;  
  Color color;
}

class ManaLogoBehavior extends Behaviour {
  var _circles = List<LogoCircle>();

  
  @override
  void init() {
    // TODO: implement init
  }

  @override
  void initFrom(Behaviour oldBehaviour) {
    // TODO: implement initFrom
  }

  // TODO: implement isInitialized
  @override
  bool get isInitialized => null;

  @override
  void paint(PaintingContext context, Offset offset) {
    // TODO: implement paint
  }

  @override
  bool tick(double delta, Duration elapsed) {
    // TODO: implement tick
  }

}
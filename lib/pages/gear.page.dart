import 'package:app/components/ScrollPaged/home.dart';
import 'package:flutter/material.dart';

class GearPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _GearPageState();
  }
}

class _GearPageState extends State<GearPage> {
  @override
  FocusNode _focusNode = new FocusNode();
  Widget build(BuildContext context) {
    return new AnimationDemoHome();
  }
}

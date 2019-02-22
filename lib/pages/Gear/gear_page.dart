import 'package:app/pages/Gear/gear_scroll.dart';
import 'package:flutter/material.dart';

class GearPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _GearPageState();
  }
}

class _GearPageState extends State<GearPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new GearScrollHome();
  }
}

import 'package:app/module/data_provider.dart';
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
  FocusNode _focusNode = new FocusNode();
  Widget build(BuildContext context) {
    final gearBloc = DataProvider.getData(context).gearBloc;
    gearBloc.loadGearBrans();
    return new AnimationDemoHome();
  }
}

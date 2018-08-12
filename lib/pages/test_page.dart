import 'dart:async';

import 'package:app/components/snap_scroll.dart';
import 'package:app/pages/SmokeSession/animation_list.dart';
import 'package:app/pages/SmokeSession/smoke_color_wheel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TestPageState();
  }
}

class _TestPageState extends State<TestPage> {
  List<double> snapPositions;
  ScrollController controller;
  ScrollController controller2;
  ScrollNotification notification;
  Timer _timer;
  @override
  void initState() {
    controller = new ScrollController();
    controller2 = new ScrollController();

    snapPositions = [200.0, 400.0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final items = List<Widget>.generate(10000, (i) => Text(i.toString()));
    return Scaffold(
        body: new CustomScrollView(
      controller: controller,
      physics: new SnapScrollPhysic(
          snaps: [size.height * 0.75, size.width, size.height * 0.75]),
      shrinkWrap: true,
      slivers: <Widget>[
        new SliverList(
          delegate: new SliverChildListDelegate(
            <Widget>[
              AnimationsPicker(),
              SizedBox(
                height: size.height * 0.75,
                child: Container(
                  child: ListView(
                    controller: controller2,
                    physics: ScrollPhysics(),
                    children: items,
                  ),
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

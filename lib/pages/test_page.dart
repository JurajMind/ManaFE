import 'dart:async';
import 'dart:convert';

import 'package:app/app/app.dart';
import 'package:app/components/snap_scroll.dart';
import 'package:app/pages/SmokeSession/animation_list.dart';
import 'package:app/pages/SmokeSession/color_picker.dart';
import 'package:app/pages/SmokeSession/smoke_color_wheel.dart';
import 'package:app/services/http.service.dart';
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
    controller = new ScrollController(initialScrollOffset: 200.0);
    controller2 = new ScrollController();
    super.initState();
  }

  Color pickerColor = new Color(0xff443a49);
  changeColor(Color color) {
    setState(() {
      pickerColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final items = List<Widget>.generate(10000, (i) => Text(i.toString()));
    return SafeArea(
      child: Scaffold(
          body: new CustomScrollView(
        controller: controller,
        physics: new SnapScrollPhysic(
            snaps: [size.height * 0.75, size.width, size.height * 0.75 - 50]),
        shrinkWrap: true,
        slivers: <Widget>[
          new SliverList(
            delegate: new SliverChildListDelegate(
              <Widget>[
                AnimationsPicker(),
                SizedBox(
                    height: size.width,
                    child: SmokeColorWheel(
                      onColorChanged: (color) {
                        App.http.changeColor('emulator', color);
                        //print(json.encode(ColorDto(color)));
                      },
                      color: HSVColor.fromColor(Colors.red),
                    )),
                SizedBox(
                  child: new ColorPicker(
                    pickerColor: pickerColor,
                    onColorChanged: changeColor,
                    colorPickerWidth: 1000.0,
                    pickerAreaHeightPercent: 0.7,
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

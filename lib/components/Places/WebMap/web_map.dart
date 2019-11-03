import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

import 'package:universal_html/html.dart';

import 'package:universal_html/html.dart';

class MapTest extends StatefulWidget {
  const MapTest({Key key}) : super(key: key);

  @override
  _MapTestState createState() => _MapTestState();
}

class _MapTestState extends State<MapTest> {
  String createdViewId = 'hello-world-html';
  @override
  void initState() {
    rootBundle.loadString('assets/mat.txt').then((value) {
      print(value);
      // ignore:undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(
          createdViewId,
          (int viewId) => IFrameElement()
            ..width = (MediaQuery.of(context).size.width - 400).toString()
            ..height = MediaQuery.of(context).size.height.toString()
            ..srcdoc = value
            ..style.border = 'none');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 640,
      height: 360,
      child: HtmlElementView(viewType: createdViewId),
    );
  }
}

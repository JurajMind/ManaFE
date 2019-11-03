import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

import 'package:universal_html/html.dart';

class MapTest extends StatefulWidget {
  const MapTest({Key key}) : super(key: key);

  @override
  _MapTestState createState() => _MapTestState();
}

class _MapTestState extends State<MapTest> {
  @override
  void initState() {
    // ignore:undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        'hello-world-html',
        (int viewId) => IFrameElement()
          ..width = '640'
          ..height = '360'
          ..src = 'https://www.youtube.com/embed/IyFZznAk69U'
          ..style.border = 'none');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebView();
  }
}

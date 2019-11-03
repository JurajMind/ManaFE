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
  bool inProgress = true;
  @override
  void initState() {
    initWeb();
    super.initState();
  }

  void initWeb() {
    String createdViewUpdate = DateTime.now().toString();

    rootBundle.loadString('map.html').then((value) {
      // ignore:undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(
          createdViewId,
          (int viewId) => IFrameElement()
            ..width = (MediaQuery.of(context).size.width - 1).toString()
            ..height = (MediaQuery.of(context).size.height - 140).toString()
            ..srcdoc = value
            ..style.border = 'none');
      setState(() {
        inProgress = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (inProgress) {
      return Center(child: CircularProgressIndicator());
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width - 1,
      height: MediaQuery.of(context).size.height - 140,
      child: HtmlElementView(viewType: createdViewId),
    );
  }
}

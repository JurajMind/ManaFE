import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class MapTest extends StatefulWidget {
    final List<PlaceSimpleDto> places;
  const MapTest({Key key, this.places}) : super(key: key);

  @override
  _MapTestState createState() => _MapTestState();
}

class _MapTestState extends State<MapTest> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

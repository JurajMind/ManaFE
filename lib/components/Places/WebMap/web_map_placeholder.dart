import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:openapi/api.dart';

class MapWeb extends StatefulWidget {
  final List<PlaceSimpleDto> places;
  const MapWeb({Key key, this.places, Set<Marker> markers, dynamic controller}) : super(key: key);

  @override
  _MapWebState createState() => _MapWebState();
}

class _MapWebState extends State<MapWeb> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class GoogleWebMapController {
  Future<void> moveToLocation(dynamic position) {}
}

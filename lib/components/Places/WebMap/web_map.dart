import 'dart:html';

import 'package:app/module/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart' hide Icon;
import 'package:google_maps_flutter/google_maps_flutter.dart' as googleFlutter;
import 'package:geolocator/geolocator.dart' as geo;
import 'dart:ui' as ui;

class MapWeb extends StatefulWidget {
  final Set<googleFlutter.Marker> markers;
  final GoogleWebMapController controller;

  const MapWeb({Key key, this.markers, this.controller}) : super(key: key);

  @override
  _MapWebState createState() => _MapWebState();
}

class _MapWebState extends State<MapWeb> {
  int htmlIdCount = 0;
  GMap map;
  @override
  void initState() {
    widget.controller.map = map;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    htmlIdCount = widget?.markers?.length ?? -1;
    String htmlId = htmlIdCount.toString();
    print("map_rebuild ${widget.markers.length}");

    // ignore: undefined_prefixed_name

    var bloc = DataProvider.getData(context).placeBloc;
    return StreamBuilder<geo.Position>(
        stream: bloc.location,
        builder: (context, snapshot) {
          if (snapshot.data == null) return Container();
          return HtmlElementView(viewType: htmlId);
        });
  }
}

class GoogleWebMapController {
  GMap map;

  GoogleWebMapController();

  Future<void> moveToLocation(googleFlutter.LatLng position) {
    map.center = new LatLng(position.latitude, position.longitude);
  }
}

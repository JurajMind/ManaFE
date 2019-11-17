import 'package:app/app/app.dart';
import 'package:app/utils/Map/location.dart';
import 'package:app/utils/Map/map_view_type.dart';
import 'package:app/utils/Map/marker.dart';
import 'package:app/utils/Map/static_map_provider.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class MapTest extends StatefulWidget {
  final List<PlaceSimpleDto> places;

  const MapTest({Key key, this.places}) : super(key: key);

  @override
  _MapTestState createState() => _MapTestState();
}

class _MapTestState extends State<MapTest> {
  String createdViewId = 'hello-world-html';
  bool inProgress = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (inProgress) {
      return Center(child: CircularProgressIndicator());
    }
    var mapUrl = mapUri().toString() + '&scale=1';

    return Image.network(
      mapUrl,
      height: 150,
      fit: BoxFit.cover,
    );
  }

  Uri mapUri() {
    var staticMapProvider = new StaticMapProvider(App.googleApiKeys);
    var mapUri = staticMapProvider.getStaticUriWithMarkersAndZoom(
        widget.places.map((place) {
          return Marker(place.id.toString(), place.name,
              double.parse(place.address.lat), double.parse(place.address.lng));
        }).toList(),
        center: new Location(double.parse(widget.places.first.address.lng),
            double.parse(widget.places.first.address.lng)),
        zoomLevel: 13,
        width: 450,
        height: 350,
        maptype: StaticMapViewType.roadmap);

    return mapUri;
  }
}

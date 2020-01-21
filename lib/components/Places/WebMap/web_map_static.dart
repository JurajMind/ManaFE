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
    if (widget.places == null) {
      return Center(child: Container());
    }

    var iStyle =
        '&style=element:geometry|color:0x1d2c4d&style=element:labels.text.fill|color:0x8ec3b9&style=element:labels.text.stroke|color:0x1a3646&style=feature:administrative.country|element:geometry.stroke|color:0x4b6878&style=feature:administrative.land_parcel|element:labels.text.fill|color:0x64779e&style=feature:administrative.province|element:geometry.stroke|color:0x4b6878&style=feature:landscape.man_made|element:geometry.stroke|color:0x334e87&style=feature:landscape.natural|element:geometry|color:0x023e58&style=feature:poi|element:geometry|color:0x283d6a&style=feature:poi|element:labels.text.fill|color:0x6f9ba5&style=feature:poi|element:labels.text.stroke|color:0x1d2c4d&style=feature:poi.park|element:geometry.fill|color:0x023e58&style=feature:poi.park|element:labels.text.fill|color:0x3C7680&style=feature:road|element:geometry|color:0x304a7d&style=feature:road|element:labels.text.fill|color:0x98a5be&style=feature:road|element:labels.text.stroke|color:0x1d2c4d&style=feature:road.highway|element:geometry|color:0x2c6675&style=feature:road.highway|element:geometry.stroke|color:0x255763&style=feature:road.highway|element:labels.text.fill|color:0xb0d5ce&style=feature:road.highway|element:labels.text.stroke|color:0x023e58&style=feature:transit|element:labels.text.fill|color:0x98a5be&style=feature:transit|element:labels.text.stroke|color:0x1d2c4d&style=feature:transit.line|element:geometry.fill|color:0x283d6a&style=feature:transit.station|element:geometry|color:0x3a4762&style=feature:water|element:geometry|color:0x0e1626&style=feature:water|element:labels.text.fill|color:0x4e6d70';
    var mapUrl = mapUri().toString() + '&scale=1' + iStyle;

    return Image.network(
      mapUrl,
      fit: BoxFit.cover,
    );
  }

  Uri mapUri() {
    var staticMapProvider = new StaticMapProvider(App.googleApiKeys);
    var markers = widget.places.map((place) {
      return Marker(place.id.toString(), place.name, double.parse(place.address.lat), double.parse(place.address.lng));
    }).toList();
    var mapUri = staticMapProvider.getStaticUriWithMarkersAndZoom(markers ?? new List<Marker>(),
        center: new Location(double.parse(widget.places.first.address.lat), double.parse(widget.places.first.address.lng)),
        zoomLevel: 13,
        width: 650,
        height: 650,
        maptype: StaticMapViewType.roadmap);

    setState(() {
      inProgress = false;
    });
    return mapUri;
  }
}

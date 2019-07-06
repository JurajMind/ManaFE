import 'package:app/app/app.dart';
import 'package:app/pages/Places/places_map_page.dart';
import 'package:app/utils/Map/location.dart';
import 'package:app/utils/Map/map_view_type.dart';
import 'package:app/utils/Map/marker.dart';
import 'package:app/utils/Map/static_map_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:openapi/api.dart';

class PlaceMap extends StatelessWidget {
  final PlaceSimpleDto place;

  const PlaceMap({Key key, this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (place?.address == null) {
      return Container();
    }
    return new InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PlacesMapPage(
              position: Position(
                  latitude: double.parse(place.address.lat),
                  longitude: double.parse(place.address.lng))))),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: new CachedNetworkImage(
          imageUrl: mapUri().toString() + '&scale=2',
          placeholder: (context, url) => new CircularProgressIndicator(),
          errorWidget: (context, url, error) => new Icon(Icons.error),
        ),
      ),
    );
  }

  Uri mapUri() {
    var staticMapProvider = new StaticMapProvider(App.googleApiKeys);
    var mapUri = staticMapProvider.getStaticUriWithMarkersAndZoom([
      new Marker(place.id.toString(), place.name,
          double.parse(place.address.lat), double.parse(place.address.lng))
    ],
        center: new Location(
            double.parse(place.address.lat), double.parse(place.address.lng)),
        zoomLevel: 13,
        width: 450,
        height: 350,
        maptype: StaticMapViewType.roadmap);

    return mapUri;
  }
}

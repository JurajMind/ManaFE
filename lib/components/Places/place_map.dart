import 'package:app/Helpers/place_helper.dart';
import 'package:app/app/app.dart';
import 'package:app/main.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/module.dart';
import 'package:app/pages/Places/places_map_page.dart';
import 'package:app/support/m_platform.dart';
import 'package:app/utils/Map/location.dart';
import 'package:app/utils/Map/map_view_type.dart';
import 'package:app/utils/Map/marker.dart';
import 'package:app/utils/Map/static_map_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'package:openapi/api.dart';

import 'distance_widget.dart';

class PlaceMap extends StatelessWidget {
  final PlaceSimpleDto place;

  const PlaceMap({Key key, this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (place?.address == null) {
      return Container();
    }
    var mapUrl = mapUri().toString() + '&scale=1';
    var location = getIt.get<PlacesBloc>().location;
    return StreamBuilder<Position>(
        stream: location,
        builder: (context, snapshot) {
          var distance = PlaceHelpers.calculateDistanceFromAddress(
              place.address, snapshot.data);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PlacesMapPage(
                        position: Position(
                            latitude: double.parse(place.address.lat),
                            longitude: double.parse(place.address.lng))))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MPlatform.isWeb
                      ? Image.network(mapUrl)
                      : new CachedNetworkImage(
                          imageUrl: mapUrl,
                          placeholder: (context, url) =>
                              new CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              new Icon(Icons.error),
                        ),
                ),
              ),
              Center(
                child: new Flex(
                  mainAxisAlignment: MainAxisAlignment.center,
                  direction: Axis.horizontal,
                  children: <Widget>[
                    new Icon(
                      FontAwesomeIcons.walking,
                      color: Colors.black,
                    ),
                    DistanceWidget(distance,
                        textStyle: Theme.of(context)
                            .textTheme
                            .headline5
                            .apply(color: Colors.black))
                  ],
                ),
              ),
            ],
          );
        });
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

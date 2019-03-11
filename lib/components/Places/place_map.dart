import 'package:app/app/app.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:map_view/location.dart';
import 'package:map_view/map_view.dart';
import 'package:map_view/static_map_provider.dart';
import 'package:openapi/api.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceMap extends StatelessWidget {
  final PlaceSimpleDto place;

  const PlaceMap({Key key, this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () => _launchMapsUrl(
          double.parse(place.address.lat), double.parse(place.address.lng)),
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

  void _launchMapsUrl(double lat, double lon) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Uri mapUri() {
    var staticMapProvider = new StaticMapProvider(App.googleApiKeys);
    var mapUri = staticMapProvider.getStaticUri(
        new Location(
            double.parse(place.address.lat), double.parse(place.address.lng)),
        13,
        width: 450,
        height: 350,
        mapType: StaticMapViewType.roadmap);

    return mapUri;
  }
}

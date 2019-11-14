import 'package:flutter/cupertino.dart';
import 'package:openapi/api.dart';

class PlacesMapPageTablet extends StatefulWidget {

  final List<PlaceSimpleDto> places;

  const PlacesMapPageTablet({Key key, this.places}) : super(key: key);

  @override
  _PlacesMapPageTabletState createState() => _PlacesMapPageTabletState();
}

class _PlacesMapPageTabletState extends State<PlacesMapPageTablet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
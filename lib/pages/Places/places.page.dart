import 'dart:async';

import 'package:app/app/app.dart';
import 'package:app/models/Places/place.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/places/places_bloc.dart';
import 'package:app/pages/Places/place_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'package:rxdart/src/subjects/behavior_subject.dart';
import 'package:location/location.dart' as geo;
import 'package:flutter/services.dart';

class PlacePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _PlacePageState();
  }
}

class _PlacePageState extends State<PlacePage> {
  MapView mapView = new MapView();
  CameraPosition cameraPosition;
  var staticMapProvider = new StaticMapProvider(App.googleApiKeys);
  Uri staticMapUri;

  Location myUserLocation;
  bool _permission = false;

  PlacesBloc placeBloc;
  @override
  initState() {
    super.initState();
    myUserLocation = null;
  }

  showMap() {
    mapView.show(
        new MapOptions(
            mapViewType: MapViewType.normal,
            showUserLocation: true,
            showMyLocationButton: true,
            showCompassButton: true,
            initialCameraPosition: new CameraPosition(myUserLocation, 15.0),
            hideToolbar: false,
            title: "Hookah places"),
        toolbarActions: [new ToolbarAction("Close", 1)]);
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    placeBloc = DataProvider.getPlaces(context);
  }

  @override
  Widget build(BuildContext context) {
    staticMapUri = staticMapProvider.getStaticUri(myUserLocation, 14,
        width: 450, height: 250, mapType: StaticMapViewType.roadmap);
//https://maps.googleapis.com/maps/api/staticmap?center=${myUserLocation.altitude},${myUserLocation.longitude}&zoom=15&format=png&maptype=roadmap&style=element:geometry%7Ccolor:0x1d2c4d&style=element:labels.text.fill%7Ccolor:0x8ec3b9&style=element:labels.text.stroke%7Ccolor:0x1a3646&style=feature:administrative.country%7Celement:geometry.stroke%7Ccolor:0x4b6878&style=feature:administrative.land_parcel%7Celement:labels.text.fill%7Ccolor:0x64779e&style=feature:administrative.province%7Celement:geometry.stroke%7Ccolor:0x4b6878&style=feature:landscape.man_made%7Celement:geometry.stroke%7Ccolor:0x334e87&style=feature:landscape.natural%7Celement:geometry%7Ccolor:0x023e58&style=feature:poi%7Celement:geometry%7Ccolor:0x283d6a&style=feature:poi%7Celement:labels.text.fill%7Ccolor:0x6f9ba5&style=feature:poi%7Celement:labels.text.stroke%7Ccolor:0x1d2c4d&style=feature:poi.business%7Cvisibility:off&style=feature:poi.park%7Celement:geometry.fill%7Ccolor:0x023e58&style=feature:poi.park%7Celement:labels.text%7Cvisibility:off&style=feature:poi.park%7Celement:labels.text.fill%7Ccolor:0x3C7680&style=feature:road%7Celement:geometry%7Ccolor:0x304a7d&style=feature:road%7Celement:labels.text.fill%7Ccolor:0x98a5be&style=feature:road%7Celement:labels.text.stroke%7Ccolor:0x1d2c4d&style=feature:road.highway%7Celement:geometry%7Ccolor:0x2c6675&style=feature:road.highway%7Celement:geometry.stroke%7Ccolor:0x255763&style=feature:road.highway%7Celement:labels.text.fill%7Ccolor:0xb0d5ce&style=feature:road.highway%7Celement:labels.text.stroke%7Ccolor:0x023e58&style=feature:transit%7Celement:labels.text.fill%7Ccolor:0x98a5be&style=feature:transit%7Celement:labels.text.stroke%7Ccolor:0x1d2c4d&style=feature:transit.line%7Celement:geometry.fill%7Ccolor:0x283d6a&style=feature:transit.station%7Celement:geometry%7Ccolor:0x3a4762&style=feature:water%7Celement:geometry%7Ccolor:0x0e1626&style=feature:water%7Celement:labels.text.fill%7Ccolor:0x4e6d70&size=900x500&key${App.googleApiKeys}

    return SafeArea(
      child: new Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned(top: 20.0, child: mapBuilder()),
                Positioned(
                    child: SizedBox(
                  height: 50.0,
                  child: new AppBar(
                    leading: BackButtonIcon(),
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () => print('search'),
                      )
                    ],
                    title: new Text('Place'),
                    centerTitle: true,
                    bottomOpacity: 0.0,
                    backgroundColor: Colors.transparent,
                    automaticallyImplyLeading: true,
                  ),
                ))
              ],
            ),
            flex: 1,
          ),
          Expanded(
            child: StreamBuilder<bool>(
                stream: placeBloc.loading,
                initialData: true,
                builder: (context, snapshot) {
                  return snapshot.data
                      ? Center(child: CircularProgressIndicator())
                      : placeBuilder(placeBloc.places);
                }),
            flex: 1,
          )
        ],
      ),
    );
  }

  StreamBuilder<List<Place>> placeBuilder(BehaviorSubject<List<Place>> places) {
    return StreamBuilder(
        stream: places,
        initialData: null,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) =>
                _createPlaceItem(index, snapshot.data[index]),
          );
        });
  }

  StreamBuilder<Location> mapBuilder() {
    return StreamBuilder(
        stream: placeBloc.location,
        initialData: null,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? CircularProgressIndicator()
              : InkWell(
                  child: new Center(
                    child: new Image.network(
                      staticMapUri.toString() +
                          '&style=element:geometry%7Ccolor:0x1d2c4d&style=element:labels.text.fill%7Ccolor:0x8ec3b9&style=element:labels.text.stroke%7Ccolor:0x1a3646&style=feature:administrative.country%7Celement:geometry.stroke%7Ccolor:0x4b6878&style=feature:administrative.land_parcel%7Celement:labels.text.fill%7Ccolor:0x64779e&style=feature:administrative.province%7Celement:geometry.stroke%7Ccolor:0x4b6878&style=feature:landscape.man_made%7Celement:geometry.stroke%7Ccolor:0x334e87&style=feature:landscape.natural%7Celement:geometry%7Ccolor:0x023e58&style=feature:poi%7Celement:geometry%7Ccolor:0x283d6a&style=feature:poi%7Celement:labels.text.fill%7Ccolor:0x6f9ba5&style=feature:poi%7Celement:labels.text.stroke%7Ccolor:0x1d2c4d&style=feature:poi.business%7Cvisibility:off&style=feature:poi.park%7Celement:geometry.fill%7Ccolor:0x023e58&style=feature:poi.park%7Celement:labels.text%7Cvisibility:off&style=feature:poi.park%7Celement:labels.text.fill%7Ccolor:0x3C7680&style=feature:road%7Celement:geometry%7Ccolor:0x304a7d&style=feature:road%7Celement:labels.text.fill%7Ccolor:0x98a5be&style=feature:road%7Celement:labels.text.stroke%7Ccolor:0x1d2c4d&style=feature:road.highway%7Celement:geometry%7Ccolor:0x2c6675&style=feature:road.highway%7Celement:geometry.stroke%7Ccolor:0x255763&style=feature:road.highway%7Celement:labels.text.fill%7Ccolor:0xb0d5ce&style=feature:road.highway%7Celement:labels.text.stroke%7Ccolor:0x023e58&style=feature:transit%7Celement:labels.text.fill%7Ccolor:0x98a5be&style=feature:transit%7Celement:labels.text.stroke%7Ccolor:0x1d2c4d&style=feature:transit.line%7Celement:geometry.fill%7Ccolor:0x283d6a&style=feature:transit.station%7Celement:geometry%7Ccolor:0x3a4762&style=feature:water%7Celement:geometry%7Ccolor:0x0e1626&style=feature:water%7Celement:labels.text.fill%7Ccolor:0x4e6d70&scale=2',
                      fit: BoxFit.fill,
                    ),
                  ),
                  onTap: showMap,
                );
        });
  }

  Widget _createPlaceItem(int index, Place data) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            settings: RouteSettings(),
            builder: (context) => PlaceDetailPage(place: data)));
      },
      leading: SizedBox(
          height: 60.0,
          width: 60.0,
          child: Hero(
            tag: '_picture',
            child: Image.network(
              'https://picsum.photos/60/60',
              fit: BoxFit.cover,
            ),
          )),
      title: Text(data.name),
      subtitle: Text(data.address.toString()),
    );
  }
}

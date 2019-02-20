import 'package:app/app/app.dart';
import 'package:app/models/extensions.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/places/place_bloc.dart';
import 'package:app/module/places/places_bloc.dart';
import 'package:app/pages/Places/place_detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class PlacePage extends StatefulWidget {
  @override
  State<PlacePage> createState() {
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

  PlacesBloc placesBloc;
  PlaceBloc placeBloc;

  @override
  initState() {
    super.initState();
    myUserLocation = new Location(50.08804, 14.42076);
  }

  showMap() {
    mapView.setMarkers(this
        .placesBloc
        .places
        .value
        .map(
          (place) => new Marker(place.id.toString(), place.name,
              double.parse(place.address.lat), double.parse(place.address.lng),
              color: Colors.blue),
        )
        .toList());

    mapView.show(
        new MapOptions(
            mapViewType: MapViewType.normal,
            showUserLocation: true,
            showMyLocationButton: true,
            showCompassButton: true,
            initialCameraPosition: new CameraPosition(
                placesBloc.location?.value ?? myUserLocation, 15.0),
            hideToolbar: false,
            title: "Hookah places"),
        toolbarActions: [
          new ToolbarAction(
            "Close",
            1,
          )
        ]);

    mapView.onToolbarAction.listen((id) {
      if (id == 1) {
        _handleDismiss();
      }
    });
  }

  _handleDismiss() async {
    mapView.dismiss();
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    placesBloc = DataProvider.getPlaces(context);
    placeBloc = DataProvider.getData(context).placeSingleBloc;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 2;
    staticMapUri = staticMapProvider.getStaticUri(
      myUserLocation,
      14,
      width: 450,
      height: height.round(),
      mapType: StaticMapViewType.roadmap,
    );
//https://maps.googleapis.com/maps/api/staticmap?center=${myUserLocation.altitude},${myUserLocation.longitude}&zoom=15&format=png&maptype=roadmap&style=element:geometry%7Ccolor:0x1d2c4d&style=element:labels.text.fill%7Ccolor:0x8ec3b9&style=element:labels.text.stroke%7Ccolor:0x1a3646&style=feature:administrative.country%7Celement:geometry.stroke%7Ccolor:0x4b6878&style=feature:administrative.land_parcel%7Celement:labels.text.fill%7Ccolor:0x64779e&style=feature:administrative.province%7Celement:geometry.stroke%7Ccolor:0x4b6878&style=feature:landscape.man_made%7Celement:geometry.stroke%7Ccolor:0x334e87&style=feature:landscape.natural%7Celement:geometry%7Ccolor:0x023e58&style=feature:poi%7Celement:geometry%7Ccolor:0x283d6a&style=feature:poi%7Celement:labels.text.fill%7Ccolor:0x6f9ba5&style=feature:poi%7Celement:labels.text.stroke%7Ccolor:0x1d2c4d&style=feature:poi.business%7Cvisibility:off&style=feature:poi.park%7Celement:geometry.fill%7Ccolor:0x023e58&style=feature:poi.park%7Celement:labels.text%7Cvisibility:off&style=feature:poi.park%7Celement:labels.text.fill%7Ccolor:0x3C7680&style=feature:road%7Celement:geometry%7Ccolor:0x304a7d&style=feature:road%7Celement:labels.text.fill%7Ccolor:0x98a5be&style=feature:road%7Celement:labels.text.stroke%7Ccolor:0x1d2c4d&style=feature:road.highway%7Celement:geometry%7Ccolor:0x2c6675&style=feature:road.highway%7Celement:geometry.stroke%7Ccolor:0x255763&style=feature:road.highway%7Celement:labels.text.fill%7Ccolor:0xb0d5ce&style=feature:road.highway%7Celement:labels.text.stroke%7Ccolor:0x023e58&style=feature:transit%7Celement:labels.text.fill%7Ccolor:0x98a5be&style=feature:transit%7Celement:labels.text.stroke%7Ccolor:0x1d2c4d&style=feature:transit.line%7Celement:geometry.fill%7Ccolor:0x283d6a&style=feature:transit.station%7Celement:geometry%7Ccolor:0x3a4762&style=feature:water%7Celement:geometry%7Ccolor:0x0e1626&style=feature:water%7Celement:labels.text.fill%7Ccolor:0x4e6d70&size=900x500&key${App.googleApiKeys}

    return SafeArea(
      top: false,
      child: new CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: height,
            title: Text('NEARBY PLACES'),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () => {},
              )
            ],
            flexibleSpace: InkWell(
              child: new FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Container(height: height, child: mapBuilder()),
              ),
            ),
          ),
          placeBuilder(placesBloc.places)
        ],
      ),
    );
  }

  StreamBuilder<List<PlaceSimpleDto>> placeBuilder(
      BehaviorSubject<List<PlaceSimpleDto>> places) {
    return StreamBuilder(
        stream: places,
        initialData: null,
        builder: (context, snapshot) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _createPlaceItem(index, snapshot.data[index]);
              },
              childCount: snapshot.data == null ? 0 : snapshot.data.length,
            ),
          );
        });
  }

  StreamBuilder<Location> mapBuilder() {
    return StreamBuilder(
        stream: placesBloc.location,
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
                  onTap: () => showMap(),
                );
        });
  }

  Widget _createPlaceItem(int index, PlaceSimpleDto data) {
    return ListTile(
      onTap: () {
        placeBloc.loadPlace(place: data);
        Navigator.of(context).push(MaterialPageRoute(
            settings: RouteSettings(),
            builder: (context) => PlaceDetailPage(place: data)));
      },
      leading: SizedBox(
          height: 60.0,
          width: 60.0,
          child: Hero(
            tag: '_picture',
            child: new Image(
              image: new CachedNetworkImageProvider(
                  Extensions.getPlaceImage(data)),
              fit: BoxFit.cover,
            ),
          )),
      title: Text(data.name),
      subtitle: Text(Extensions.adress(data.address)),
    );
  }
}

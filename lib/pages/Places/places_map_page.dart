import 'dart:async';

import 'package:app/app/app.dart';

import 'package:app/components/Places/map_carousel.dart';
import 'package:app/const/theme.dart';
import 'package:app/models/extensions.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/places/places_bloc.dart';
import 'package:app/pages/Places/places_search_page.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:math' show cos, sqrt, asin;

class PlacesMapPage extends StatefulWidget {
  final Position position;

  PlacesMapPage({this.position});

  @override
  State<PlacesMapPage> createState() => _PlacesMapPageState();
}

class _PlacesMapPageState extends State<PlacesMapPage> {
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition initView;
  CameraPosition curentView;
  CameraPosition lastIdleView;
  Set<Marker> markers;
  bool loading = false;
  BehaviorSubject<List<PlaceSimpleDto>> nearbyPlaces =
      new BehaviorSubject<List<PlaceSimpleDto>>.seeded(null);
  PlacesBloc bloc;
  @override
  initState() {
    super.initState();
    curentView = new CameraPosition(
        target: LatLng(widget.position.latitude, widget.position.longitude));
    lastIdleView = curentView;
    markers = new Set<Marker>();
    if (widget.position != null) {
      initView = CameraPosition(
        target: LatLng(widget.position.latitude, widget.position.longitude),
        zoom: 14.4746,
      );
    }

    if (widget.position == null) {
      initView = CameraPosition(
        target: LatLng(37.42796133580664, -122.085749655962),
        zoom: 14.4746,
      );
    }

    new Future.delayed(Duration.zero, () {
      bloc = DataProvider.getData(context).placeBloc;
      setMarkers(bloc.places.value);
      nearbyPlaces.add(bloc.places.value);
      bloc.places.doOnData((onData) {
        setMarkers(onData);
        nearbyPlaces.add(onData);
      });
    });
  }

  double calculateDistance(LatLng pos1, LatLng pos2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((pos2.latitude - pos1.latitude) * p) / 2 +
        c(pos1.latitude * p) *
            c(pos2.latitude * p) *
            (1 - c((pos2.longitude - pos1.longitude) * p)) /
            2;
    return 12742 * asin(sqrt(a));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: new Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: SizedBox(
          height: 55,
        ),
        body: StreamBuilder<List<PlaceSimpleDto>>(
            stream: nearbyPlaces,
            builder: (context, snapshot) {
              return Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Expanded(
                        child: GoogleMap(
                          markers: markers,
                          myLocationEnabled: true,
                          onCameraIdle: () {
                            var distance = calculateDistance(
                                lastIdleView.target, curentView.target);

                            lastIdleView = curentView;
                            if (distance > 5) {
                              loadNearby();
                            }
                          },
                          onCameraMove: (cv) {
                            curentView = cv;
                          },
                          mapType: MapType.normal,
                          compassEnabled: true,
                          tiltGesturesEnabled: true,
                          initialCameraPosition: initView,
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                        ),
                      ),
                      SizedBox(height: 140)
                    ],
                  ),
                  Positioned(
                    bottom: 10,
                    child: Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      child: MapCarousel(
                          nearbyPlaces: nearbyPlaces,
                          mapController: _controller),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: MediaQuery.of(context).size.width / 2,
                    child: FloatingActionButton(
                      heroTag: 'Search',
                      backgroundColor: AppColors.scafBg,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onPressed: () => searchCity(context),
                    ),
                  ),
                
                  Positioned(
                     top: 10,
                    right: (MediaQuery.of(context).size.width / 2) - 60, 
                    child: FloatingActionButton(
                        heroTag: "refresh",
                        backgroundColor: AppColors.scafBg,
                        child: loading
                            ? CircularProgressIndicator()
                            : Icon(
                                Icons.refresh,
                                 color: Colors.white,
                              ),
                        onPressed: () => loadNearby()),
                  )
                ],
              );
            }),
      ),
    );
  }

  void searchCity(BuildContext context) async {
    var result = await Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      return new PlacesSearchPage(
        places: nearbyPlaces.value,
        returnToMap: true,
      );
    }));

    if (result != null) {
      var controller = await _controller.future;
      var location = result as LatLng;
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          bearing: 0, target: location, tilt: 0, zoom: 15.151926040649414)));
    }
  }

  void loadNearby({LatLng imPosition}) async {
    setState(() {
      loading = true;
    });
    var position = imPosition ?? curentView.target;
    var newPlaces = await App.http
        .getNearbyPlaces(lat: position.latitude, lng: position.longitude);
    nearbyPlaces.add(newPlaces);
    setMarkers(newPlaces);
    setState(() {
      loading = false;
    });
  }

  void setMarkers(List<PlaceSimpleDto> places) {
    markers = places.map((f) {
      return new Marker(
          markerId: MarkerId(f.id.toString()),
          infoWindow:
              InfoWindow(title: f.name, snippet: Extensions.adress(f.address)),
          position:
              LatLng(double.parse(f.address.lat), double.parse(f.address.lng)));
    }).toSet();
  }
}

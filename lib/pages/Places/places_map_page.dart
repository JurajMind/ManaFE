import 'dart:async';

import 'package:app/Helpers/date_utils.dart';
import 'package:app/app/app.dart';
import 'package:app/components/Places/GooglePlaceAutocomplete/google_places.dart';

import 'package:app/components/Places/map_carousel.dart';
import 'package:app/const/theme.dart';
import 'package:app/models/extensions.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/pages/Places/places_search_page.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

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
  Set<Marker> markers;
  bool loading = false;
  BehaviorSubject<List<PlaceSimpleDto>> nearbyPlaces =
      new BehaviorSubject<List<PlaceSimpleDto>>.seeded(null);
  @override
  initState() {
    super.initState();
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
  }

  @override
  Widget build(BuildContext context) {
    var placeBloc = DataProvider.getData(context).placeBloc;
    if (this.nearbyPlaces.value == null) {
      setMarkers(placeBloc.places.value);
    }

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
                          onCameraMove: (cv) => curentView = cv,
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
                    right: 10,
                    child: FloatingActionButton(
                      heroTag: 'Search',
                      backgroundColor: AppColors.blue,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onPressed: () => searchCity(context),
                    ),
                  ),
                  /* Positioned(
                    bottom: 160,
                    right: 10,
                    child: FloatingActionButton(
                      backgroundColor: AppColors.gray.withAlpha(40),
                      child: Icon(
                        Icons.track_changes,
                        color: Colors.black,
                      ),
                      onPressed: () async {
                        var controller = await _controller.future;
                        Geolocator()
                            .getLastKnownPosition(
                                desiredAccuracy: LocationAccuracy.low)
                            .then((value) {
                          if (value != null) {
                            var location =
                                LatLng(value.latitude, value.longitude);
                            loadNearby(imPosition: location);
                            var position = CameraUpdate.newCameraPosition(
                                CameraPosition(
                                    bearing: 0,
                                    target: location,
                                    tilt: 0,
                                    zoom: 15.151926040649414));
                            controller.animateCamera(position);
                          }
                        });
                      },
                    ),
                  ),*/
                  Positioned(
                    bottom: 260,
                    right: 10,
                    child: FloatingActionButton(
                        heroTag: "refresh",
                        backgroundColor: AppColors.green.withAlpha(40),
                        child: loading
                            ? CircularProgressIndicator()
                            : Icon(
                                Icons.refresh,
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
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      return new PlacesSearchPage(
        places: nearbyPlaces.value,
      );
    }));
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

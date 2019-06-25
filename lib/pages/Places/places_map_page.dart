import 'dart:async';

import 'package:app/app/app.dart';

import 'package:app/components/Places/map_carousel.dart';
import 'package:app/components/Reservations/reservation_item.dart';
import 'package:app/const/theme.dart';
import 'package:app/models/extensions.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/places/places_bloc.dart';
import 'package:app/pages/Places/place_detail_page.dart';
import 'package:app/pages/Places/places_search_page.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:openapi/api.dart';
import 'package:queries/collections.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:math' show cos, sqrt, asin;
import 'package:flutter/services.dart' show rootBundle;

import 'Reservations/reservations_page.dart';

class PlacesMapPage extends StatefulWidget {
  final Position position;
  final PlaceDto place;

  PlacesMapPage({this.position, this.place});

  @override
  State<PlacesMapPage> createState() => _PlacesMapPageState();
}

class _PlacesMapPageState extends State<PlacesMapPage> {
  String _mapStyle;
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition initView;
  CameraPosition curentView;
  CameraPosition lastIdleView;
  Set<Marker> markers;
  bool loading = false;
  BehaviorSubject<List<PlaceSimpleDto>> nearbyPlaces =
      new BehaviorSubject<List<PlaceSimpleDto>>.seeded(null);
  PlacesBloc bloc;
  BitmapDescriptor _manaMarker;
  PlaceSimpleDto _selectedPlace;
  bool moving = false;

  StreamSubscription<Position> positionSub;
  @override
  initState() {
    super.initState();
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
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
    curentView = initView;
    lastIdleView = curentView;

    new Future.delayed(Duration.zero, () {
      bloc = DataProvider.getData(context).placeBloc;
      positionSub = bloc.location.asBroadcastStream().listen((newPosition) {
        setView(newPosition);
      });

      setMarkers(bloc.places.value);
      nearbyPlaces.add(bloc.places.value);
      bloc.places.doOnData((onData) {
        setMarkers(onData);
        nearbyPlaces.add(onData);
      });

      if (widget.position != null) {
        loadNearby();
      }
      _createMarkerImageFromAsset(context);
    });
  }

  @override
  dispose() {
    super.dispose();
    positionSub.cancel();
  }

  Future setView(Position position) async {
    if (widget?.position != null || widget?.place?.address != null) return;
    if (position == null) return;
    var view = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 14.4746,
    );
    var c = await _controller.future;
    c.animateCamera(CameraUpdate.newCameraPosition(view));
  }

  Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    if (_manaMarker == null) {
      final ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(imageConfiguration, 'assets/man_pin.png')
          .then(_updateBitmap);
    }
  }

  void _updateBitmap(BitmapDescriptor bitmap) {
    setState(() {
      _manaMarker = bitmap;
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
    var reservationBloc = DataProvider.getData(context).reservationBloc;
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
                            setState(() {
                              moving = false;
                            });
                            lastIdleView = curentView;
                            if (distance > 5) {
                              loadNearby();
                            }
                          },
                          onCameraMove: (cv) {
                            curentView = cv;
                            if (!moving)
                              setState(() {
                                moving = true;
                              });
                          },
                          mapType: MapType.normal,
                          compassEnabled: true,
                          tiltGesturesEnabled: true,
                          initialCameraPosition: initView,
                          onMapCreated: (GoogleMapController controller) {
                            controller.setMapStyle(_mapStyle);
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
                          selectedPlace: _selectedPlace,
                          nearbyPlaces: nearbyPlaces,
                          mapController: _controller),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: MediaQuery.of(context).size.width / 2,
                    child: moving
                        ? Container()
                        : FloatingActionButton(
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
                    top: 0,
                    left: 0,
                    child: IconButton(
                      icon: Icon(Icons.chevron_left,
                          color: Colors.black, size: 50),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: (MediaQuery.of(context).size.width / 2) - 60,
                    child: moving
                        ? Container()
                        : FloatingActionButton(
                            heroTag: "refresh",
                            backgroundColor: AppColors.scafBg,
                            child: loading
                                ? CircularProgressIndicator()
                                : Icon(
                                    Icons.refresh,
                                    color: Colors.white,
                                  ),
                            onPressed: () => loadNearby()),
                  ),
                  Positioned(
                      bottom: 150,
                      right: (MediaQuery.of(context).size.width / 2) - 60,
                      child: moving
                          ? Container()
                          : Container(
                              child: Row(children: [
                              OutlineButton(
                                color: Colors.black,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                                borderSide: BorderSide(color: Colors.white),
                                hoverColor: Colors.black,
                                child: Text(
                                  'All reservations',
                                  style: Theme.of(context).textTheme.display3,
                                ),
                                onPressed: () => Navigator.of(context).push(
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) {
                                      return new ReservationsPage();
                                    })),
                              )
                            ]))),
                ],
              );
            }),
      ),
    );
  }

  StreamBuilder<List<PlacesReservationsReservationDto>> reservationBuilder(
      BehaviorSubject<List<PlacesReservationsReservationDto>> reservations) {
    return StreamBuilder(
        stream: reservations,
        initialData: null,
        builder: (context, snapshot) {
          PlacesReservationsReservationDto reservation;
          if (snapshot.data != null) {
            var upcomingReservations = new Collection(snapshot.data);
            reservation = upcomingReservations
                .where$1((predicate, _) =>
                    predicate.time.compareTo(DateTime.now()) > 0 &&
                    predicate.status != 1)
                .orderBy((p) => p.time)
                .firstOrDefault();
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (reservation == null) {
                  return Container();
                }
                return ReservationItem(reservation: reservation ?? null);
              },
              childCount:
                  snapshot.data == null ? 0 : snapshot.data.length == 0 ? 0 : 1,
            ),
          );
        });
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
          icon: f.haveMana ? _manaMarker : BitmapDescriptor.defaultMarker,
          onTap: () async {
            var controller = await _controller.future;
            if (_selectedPlace == f) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PlaceDetailPage(place: f)));
            }
            setState(() {
              _selectedPlace = f;
            });
            controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    bearing: 0,
                    target: new LatLng(double.parse(f.address.lat),
                        double.parse(f.address.lng)),
                    tilt: 0,
                    zoom: 15.151926040649414)));
          },
          markerId: MarkerId(f.id.toString()),
          infoWindow:
              InfoWindow(title: f.name, snippet: Extensions.adress(f.address)),
          position:
              LatLng(double.parse(f.address.lat), double.parse(f.address.lng)));
    }).toSet();
  }
}

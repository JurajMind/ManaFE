import 'dart:async';

import 'package:app/app/app.dart';
//import 'package:app/components/Places/WebMap/web_map_placeholder.dart' if (dart.library.js) 'package:app/components/Places/WebMap/web_map.dart';

import 'package:app/components/Places/WebMap/web_map_placeholder.dart'
    if (dart.library.js) 'package:app/components/Places/WebMap/web_map.dart';
import 'package:app/components/Places/map_carousel.dart';
import 'package:app/components/Reservations/reservation_item.dart';
import 'package:app/const/theme.dart';
import 'package:app/main.dart';
import 'package:app/models/extensions.dart';
import 'package:app/module/module.dart';
import 'package:app/module/places/places_bloc.dart';
import 'package:app/pages/Places/place_detail_page.dart';
import 'package:app/pages/Places/places_search_page.dart';
import 'package:app/support/m_platform.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:openapi/openapi.dart';
import 'package:darq/darq.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:math' show cos, sqrt, asin;
import 'package:flutter/services.dart' show rootBundle;
import 'Components/reservation_button.dart';

import 'Manage/Components/manage_place_btn.dart';

class PlacesMapPage extends StatefulWidget {
  final Position? position;
  final PlaceDto? place;

  PlacesMapPage({this.position, this.place});

  @override
  State<PlacesMapPage> createState() => _PlacesMapPageState();
}

class _PlacesMapPageState extends State<PlacesMapPage> {
  String? _mapStyle;

  Completer<GoogleMapController> _controller = Completer();
  GoogleWebMapController webMapController = new GoogleWebMapController();
  CameraPosition? initView;
  CameraPosition? curentView;
  CameraPosition? lastIdleView;
  Set<Marker>? markers;
  Set<Marker>? originMarkers;
  bool loading = false;
  BehaviorSubject<List<PlaceSimpleDto>?> nearbyPlaces = new BehaviorSubject<List<PlaceSimpleDto>?>.seeded(null);
  late PlacesBloc bloc;
  BitmapDescriptor? _manaMarker;
  PlaceSimpleDto? _selectedPlace;
  bool moving = false;
  bool isDefaultPage = true;
  String? searchLabel;

  late StreamSubscription<Position> positionSub;

  double minClusterZoom = 10.5;
  @override
  initState() {
    originMarkers = new Set();
    super.initState();

    isDefaultPage = widget.position == null && widget.place == null;
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
    markers = new Set<Marker>();
    if (widget.position != null) {
      initView = CameraPosition(
        target: LatLng(widget.position!.latitude, widget.position!.longitude),
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
      bloc = getIt.get<PlacesBloc>();
      positionSub = bloc.location.asBroadcastStream().listen((newPosition) {
        setView(newPosition);
      });

      setMarkers(bloc.places.valueOrNull);
      nearbyPlaces.add(bloc.places.valueOrNull);
      bloc.places.listen((onData) {
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
    if (widget.position != null || widget.place?.address != null) return;
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
      final ImageConfiguration imageConfiguration = createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(imageConfiguration, 'assets/man_pin.png').then(_updateBitmap);
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
        c(pos1.latitude * p) * c(pos2.latitude * p) * (1 - c((pos2.longitude - pos1.longitude) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var isLansdscape = MediaQuery.of(context).orientation == Orientation.landscape;
    var useTabletLayout = shortestSide > 600;

    return SafeArea(
      top: true,
      child: new Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: SizedBox(
          height: 55,
        ),
        body: StreamBuilder<List<PlaceSimpleDto>?>(
            stream: nearbyPlaces,
            builder: (context, snapshot) {
              return useTabletLayout || isLansdscape
                  ? Row(
                      children: <Widget>[
                        buildExpandedMap(snapshot),
                        Container(
                          constraints: BoxConstraints(maxWidth: useTabletLayout ? 400 : 200),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        buildFloatingSearchButton(context),
                                        buildFloatingRefreshButton(),
                                        ManagePlaceBtn()
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    ReservationButton(),
                                    SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: MapCarousel(
                                  direction: Axis.vertical,
                                  selectedPlace: _selectedPlace,
                                  nearbyPlaces: nearbyPlaces,
                                  mapController: _controller,
                                  webMapController: webMapController,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[buildExpandedMap(snapshot), SizedBox(height: 140)],
                        ),
                        Positioned(
                          bottom: 10,
                          child: Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                            child: MapCarousel(
                              selectedPlace: _selectedPlace,
                              nearbyPlaces: nearbyPlaces,
                              mapController: _controller,
                              webMapController: webMapController,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: MediaQuery.of(context).size.width * 0.2,
                          child: AnimatedOpacity(
                            opacity: !moving ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 500),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  buildFloatingSearchButton(context),
                                  buildFloatingRefreshButton(),
                                  ManagePlaceBtn()
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 0,
                            left: 0,
                            child: isDefaultPage
                                ? Container()
                                : IconButton(
                                    icon: Icon(Icons.chevron_left, color: Colors.black, size: 50),
                                    onPressed: () => Navigator.of(context).pop(),
                                  )),
                        Positioned(
                            bottom: 170,
                            right: (MediaQuery.of(context).size.width / 2) - 60,
                            child: AnimatedOpacity(
                                opacity: !moving ? 1.0 : 0.0,
                                duration: Duration(milliseconds: 500),
                                child: new ReservationButton())),
                      ],
                    );
            }),
      ),
    );
  }

  FloatingActionButton buildFloatingRefreshButton() {
    return FloatingActionButton(
        heroTag: "refresh",
        backgroundColor: AppColors.scafBg,
        child: loading
            ? CircularProgressIndicator()
            : Icon(
                Icons.refresh,
                color: Colors.white,
              ),
        onPressed: () => loadNearby());
  }

  FloatingActionButton buildFloatingSearchButton(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'Search',
      backgroundColor: AppColors.scafBg,
      child: Icon(
        Icons.search,
        color: Colors.white,
      ),
      onPressed: () => searchCity(context),
    );
  }

  Expanded buildExpandedMap(AsyncSnapshot<List<PlaceSimpleDto>?> snapshot) {
    return Expanded(
      child: MPlatform.isWeb
          ? RepaintBoundary(
              child: MapWeb(
              controller: webMapController,
              markers: markers,
            ))
          : GoogleMap(
              markers: markers!,
              myLocationEnabled: true,
              onCameraIdle: () {
                var distance = calculateDistance(lastIdleView!.target, curentView!.target);

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
              initialCameraPosition: initView!,
              onMapCreated: (GoogleMapController controller) {
                controller.setMapStyle(_mapStyle);
                _controller.complete(controller);
              },
            ),
    );
  }

  StreamBuilder<List<PlacesReservationsReservationDto>> reservationBuilder(
      BehaviorSubject<List<PlacesReservationsReservationDto>> reservations) {
    return StreamBuilder(
        stream: reservations,
        initialData: null,
        builder: (context, snapshot) {
          PlacesReservationsReservationDto? reservation;
          if (snapshot.data != null) {
            var upcomingReservations = new List.from(snapshot.data!);
            reservation = upcomingReservations
                .where((predicate) => predicate.time.compareTo(DateTime.now()) > 0 && predicate.status != 1)
                .orderBy((p) => p.time)
                .firstOrDefault(defaultValue: null);
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (reservation == null) {
                  return Container();
                }
                return ReservationItem(reservation: reservation);
              },
              childCount: snapshot.data == null
                  ? 0
                  : snapshot.data!.length == 0
                      ? 0
                      : 1,
            ),
          );
        });
  }

  void searchCity(BuildContext context) async {
    var result = await Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {
      return new PlacesSearchPage(
        places: nearbyPlaces.value,
        returnToMap: true,
        searchLabel: searchLabel,
      );
    }));

    if (result != null) {
      var controller = await _controller.future;
      var location = result as PlacesSearchResult;
      nearbyPlaces.add(location.places);
      this.searchLabel = location.label;
      controller
          .animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(bearing: 0, target: location.position!, tilt: 0, zoom: 15.151926040649414)))
          .then((_) {
        setState(() {
          this._selectedPlace = location.places!.first;
        });
      });
    }
  }

  void loadNearby({LatLng? imPosition}) async {
    setState(() {
      loading = true;
    });
    var position = imPosition ?? curentView!.target;
    var newPlaces = await App.http!.getNearbyPlaces(lat: position.latitude, lng: position.longitude);

    var oldPlaces = nearbyPlaces.value;
    var merge = <PlaceSimpleDto>[];
    if (oldPlaces != null) merge.addAll(oldPlaces);
    merge.addAll(newPlaces);

    var a = new List.from(merge).distinct(((element) => element) as Object Function(dynamic)?).toList();
    this.nearbyPlaces.add(a as List<PlaceSimpleDto>?);
    setMarkers(a as List<PlaceSimpleDto>?);

    setState(() {
      loading = false;
    });
  }

  void setMarkers(List<PlaceSimpleDto>? places) {
    if (places == null) return;
    var newMarkers = places.map((f) {
      var marker = new Marker(
          icon: f.haveMana! ? _manaMarker! : BitmapDescriptor.defaultMarker,
          onTap: () async {
            if (_selectedPlace == f) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlaceDetailPage(place: f)));
            }
            setState(() {
              _selectedPlace = f;
            });
            if (MPlatform.isWeb) {
              webMapController.moveToLocation(LatLng(double.parse(f.address!.lat!), double.parse(f.address!.lng!)));
              return;
            }
            var controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                bearing: 0,
                target: new LatLng(double.parse(f.address!.lat!), double.parse(f.address!.lng!)),
                tilt: 0,
                zoom: 15.151926040649414)));
          },
          markerId: MarkerId(f.id.toString()),
          infoWindow: InfoWindow(
              title: f.name,
              snippet: Extensions.adress(f.address),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlaceDetailPage(place: f)));
              }),
          position: LatLng(double.parse(f.address!.lat!), double.parse(f.address!.lng!)));
      return marker;
    }).toSet();

    this.markers = newMarkers;
    this.originMarkers = newMarkers;
  }

  updateMarkers(Set<Marker> markers) {
    if (curentView!.zoom > minClusterZoom) {
      setState(() {
        this.markers = this.originMarkers;
      });
    } else {
      setState(() {
        var updatedMarkers = markers.map((f) {
          return new Marker(
              markerId: f.markerId,
              icon: f.icon,
              position: f.position,
              onTap: () async {
                {
                  var controller = await _controller.future;
                  controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                    bearing: 0,
                    zoom: minClusterZoom + 0.2,
                    target: f.position,
                    tilt: 0,
                  )));
                }
              });
        }).toSet();
        this.markers = updatedMarkers;
      });
      {}
    }
  }
}

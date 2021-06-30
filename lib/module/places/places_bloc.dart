import 'dart:async';

import 'package:app/app/app.dart';
import 'package:geolocator/geolocator.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

import 'dart:convert';

class PlacesBloc {
  bool serviceEnabled;
  LocationPermission permission;
  String error;

  BehaviorSubject<List<PlaceSimpleDto>> places =
      new BehaviorSubject<List<PlaceSimpleDto>>();
  BehaviorSubject<bool> loading = new BehaviorSubject<bool>.seeded(false);

  BehaviorSubject<bool> localizationnPermision =
      new BehaviorSubject<bool>.seeded(false);

  BehaviorSubject<Position> location = new BehaviorSubject<Position>();

  StreamSubscription<Position> posSub;

  static final PlacesBloc _instance = new PlacesBloc._();

  factory PlacesBloc() => PlacesBloc._instance;

  PlacesBloc._() {
    this.loading.add(true);
  }

  Future loadPlaces() async {
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return;
      }

      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return;
      }
    }

    var position = await Geolocator.getLastKnownPosition();
    if (position == null) {
      position = await Geolocator.getCurrentPosition();
    }
    location.add(position);
    await _loadPlaces();

    posSub = Geolocator.getPositionStream().listen((onData) {
      print(onData);
      this.location.add(onData);
    });
  }

  Future _loadPlaces() async {
    if (location.value == null) return;
    var lat = location.value.latitude;
    var lng = location.value.longitude;

    App.http.getNearbyPlaces(lat: lat, lng: lng).then((places) async {
      this.places.add(places);
      var db = await App.cache.getDatabase();
      //var key = await db.put(json.encode(places), 'places');
      this.loading.add(false);
    });
  }

  Future loadPlacesFromCache() async {
    try {
      var db = await App.cache.getDatabase();
      //var value = await db.get('places');
      var value;
      if (value == null) {
        return;
      }

      var it = json.decode(value);
      var fromCache = PlaceSimpleDto.listFromJson(it);
      this.places.add(fromCache);
      this.loading.add(false);
    } catch (e) {
      print('error');
      print(e);
    }
  }

  replacePlaces(List<PlaceSimpleDto> value) {
    this.places.add(value);
  }
}

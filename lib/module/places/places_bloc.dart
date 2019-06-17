import 'package:app/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

import 'dart:convert';

class PlacesBloc {
  bool _permission = false;
  String error;
  BehaviorSubject<List<PlaceSimpleDto>> places =
      new BehaviorSubject<List<PlaceSimpleDto>>();
  BehaviorSubject<bool> loading = new BehaviorSubject<bool>.seeded(false);

  BehaviorSubject<bool> localizationnPermision =
      new BehaviorSubject<bool>.seeded(false);

  BehaviorSubject<Position> location = new BehaviorSubject<Position>();

  static final PlacesBloc _instance = new PlacesBloc._();

  factory PlacesBloc() => PlacesBloc._instance;

  PlacesBloc._() {
    this.loading.add(true);
  }

  Future loadPlaces() async {
    var geolocator = Geolocator();
    GeolocationStatus geolocationStatus =
        await geolocator.checkGeolocationPermissionStatus();
    if (geolocationStatus != GeolocationStatus.denied) return;
    geolocator
        .getLastKnownPosition(desiredAccuracy: LocationAccuracy.low)
        .then((value) async {
      if (value != null) {
        location.add(value);
        await _loadPlaces();
      }
    });
    loadPlacesFromCache();

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      this.location.add(value);
      _loadPlaces();
    });
  }

  Future _loadPlaces() async {
    if (location.value == null) return;
    var lat = location.value.latitude;
    var lng = location.value.longitude;

    App.http.getNearbyPlaces(lat: lat, lng: lng).then((places) async {
      this.places.add(places);
      var db = await App.cache.getDatabase();
      var key = await db.put(json.encode(places), 'places');
      this.loading.add(false);
    });
  }

  Future loadPlacesFromCache() async {
    try {
      var db = await App.cache.getDatabase();
      var value = await db.get('places');
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

  Future<bool> _getPermissionStatus() async {
    final res = false; //await _location.hasPermission();

    localizationnPermision.add(res);
    return res;
  }
}

import 'package:app/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutter/services.dart';
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
    Geolocator()
        .getLastKnownPosition(desiredAccuracy: LocationAccuracy.low)
        .then((value) {
      if (value != null) {
        location.add(value);
      }
    });
    loadPlacesFromCache();

    double lat = -200;
    double lng = -200;
    if (location.value != null) {
      lat = location.value.latitude;
      lng = location.value.longitude;
    }
    App.http.getNearbyPlaces(lat: lat, lng: lng).then((places) async {
      this.places.add(places);
      var db = await App.cache.getDatabase();
      var key = await db.put(json.encode(places), 'places');
      this.loading.add(false);
    });

    Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) => {this.location.add(value)});
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

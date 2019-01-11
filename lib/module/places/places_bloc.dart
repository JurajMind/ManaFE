import 'package:app/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:location/location.dart';
import 'package:map_view/map_view.dart' as map;
import 'package:flutter/services.dart';
import 'dart:convert';

class PlacesBloc {
  Location _location = new Location();

  BehaviorSubject<List<PlaceSimpleDto>> places =
      new BehaviorSubject<List<PlaceSimpleDto>>(
          seedValue: new List<PlaceSimpleDto>());

  BehaviorSubject<bool> loading = new BehaviorSubject(seedValue: false);

  BehaviorSubject<bool> localizationnPermision =
      new BehaviorSubject(seedValue: false);

  BehaviorSubject<map.Location> location =
      new BehaviorSubject(seedValue: new map.Location(0.0, 0.0));

  static final PlacesBloc _instance = new PlacesBloc._();

  factory PlacesBloc() => PlacesBloc._instance;

  PlacesBloc._() {
    this.loading.add(true);
  }

  Future loadPlaces() async {
    await loadPlacesFromCache();

    map.Location location = null;// await getLocation();
    if (location == null) {
      location = new map.Location(0.0, 0.0);
    }
    await App.http
        .getNearbyPlaces(lat: location.latitude, lng: location.longitude)
        .then((places) async {
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
    final res = await _location.hasPermission();

    localizationnPermision.add(res);
    return res;
  }

  Future<map.Location> getLocation() async {
    // Platform messages may fail, so we use a try/catch PlatformException.

    try {
      var _permission = await this._getPermissionStatus();
      if (!_permission) {
        return location.value;
      }
      var rawlocation = await _location.getLocation();
      var sl = map.Location(rawlocation['latitude'], rawlocation['longitude']);
      if (sl == null) return null;
      location.add(sl);
      return sl;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        location = null;
      }
    }
  }
}

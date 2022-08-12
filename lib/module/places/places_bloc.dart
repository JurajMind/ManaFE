import 'dart:async';

import 'package:app/app/app.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:openapi/openapi.dart';
import 'package:rxdart/rxdart.dart';

import 'dart:convert';

class PlacesBloc {
  late bool serviceEnabled;
  LocationPermission? permission;
  String? error;
  Box? cache;

  BehaviorSubject<List<PlaceSimpleDto>> places = new BehaviorSubject<List<PlaceSimpleDto>>();
  BehaviorSubject<bool> loading = new BehaviorSubject<bool>.seeded(false);

  BehaviorSubject<bool> localizationnPermision = new BehaviorSubject<bool>.seeded(false);

  BehaviorSubject<Position> location = new BehaviorSubject<Position>();

  StreamSubscription<Position>? posSub;

  PlacesBloc() {
    this.loading.add(true);
  }

  Future loadPlaces() async {
    await loadPlacesFromCache();
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

    posSub = Geolocator.getPositionStream(locationSettings: LocationSettings(distanceFilter: 50)).listen((onData) {
      print(onData);
      this.location.add(onData);
    });
  }

  Future _loadPlaces() async {
    if (location.value == null) return;
    var lat = location.value.latitude;
    var lng = location.value.longitude;

    App.http!.getNearbyPlaces(lat: lat, lng: lng).then((places) async {
      this.places.add(places);
      cache!.put('nearby', places);
      this.loading.add(false);
    });
  }

  Future<void> loadPlacesFromCache() async {
    try {
      if (cache == null) {
        cache = await Hive.openBox('places');
      }
      var fromCache = cache!.get('nearby');
      if (fromCache == null) {
        return;
      }
      if (fromCache is List<dynamic>) this.places.add(fromCache.map((e) => e as PlaceSimpleDto).toList());
      this.loading.add(false);
    } catch (e) {
      print('error');
      print(e);
    }
  }
}

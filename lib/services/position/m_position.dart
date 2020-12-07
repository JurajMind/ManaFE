import 'package:app/services/position/position_polyfy_fake.dart'
    if (dart.library.js) 'package:app/services/position/position_polyfy.dart'
    as wgeo;
import 'package:app/support/m_platform.dart';
import 'package:geolocator/geolocator.dart';

class MPosition {
  static Geolocator _geo;
  static wgeo.WGeolocation _wgeo;

  static final MPosition _instance = new MPosition._();

  factory MPosition() => MPosition._instance;

  MPosition._() {
    if (!MPlatform.isWeb) {
      _geo = new Geolocator();
    } else {
      _wgeo = new wgeo.WGeolocation();
    }
  }

  Stream<Position> getPositionStream([
    LocationOptions locationOptions = const LocationOptions(),
  ]) {
    if (MPlatform.isWeb) {
      return _wgeo.watchPosition().map((a) {
        return new Position(
            latitude: a.coordinates.latitude,
            longitude: a.coordinates.longitude);
      });
    }
    return Geolocator.getPositionStream();
  }

  Future<LocationPermission> checkGeolocationPermissionStatus() async {
    if (MPlatform.isWeb) {
      var a = await _wgeo.getCurrentPosition(
          enableHighAccuracy: false,
          timeout: new Duration(seconds: 10),
          maximumAge: Duration(hours: 1));
      if (a != null) {
        return LocationPermission.always;
      } else {
        return LocationPermission.denied;
      }
    }

    return await Geolocator.checkPermission();
  }

  Future<Position> getLastKnownPosition({
    LocationAccuracy desiredAccuracy = LocationAccuracy.best,
  }) async {
    if (MPlatform.isWeb) {
      var a = await _wgeo.getCurrentPosition(
          enableHighAccuracy: false,
          timeout: new Duration(seconds: 1),
          maximumAge: Duration(days: 1));
      return new Position(
          latitude: a.coordinates.latitude, longitude: a.coordinates.longitude);
    }

    return await Geolocator.getLastKnownPosition();
  }

  Future<Position> getCurrentPosition({
    LocationAccuracy desiredAccuracy = LocationAccuracy.best,
  }) async {
    if (MPlatform.isWeb) {
      var a = await _wgeo.getCurrentPosition(
          enableHighAccuracy: false,
          timeout: new Duration(seconds: 1),
          maximumAge: Duration(hours: 1));
      return new Position(
          latitude: a.coordinates.latitude, longitude: a.coordinates.longitude);
    }

    return await Geolocator.getCurrentPosition();
  }
}

import 'package:app/services/position/position_polyfy.dart' as wgeo;
import 'package:app/support/m_platform.dart';
import 'package:geolocator/geolocator.dart';
import 'package:universal_html/prefer_sdk/html.dart' as html;

class MPosition {
  static Geolocator _geo;
  static wgeo.WGeolocation _wgeo;

  static final MPosition _instance = new MPosition._();

  factory MPosition() => MPosition._instance;

  MPosition._() {
    _geo = new Geolocator();
    _wgeo = new wgeo.WGeolocation();
  }

  Future<GeolocationStatus> checkGeolocationPermissionStatus(
      {GeolocationPermission locationPermission =
          GeolocationPermission.location}) async {
    if (MPlatform.isWeb) {
      var a = await _wgeo.getCurrentPosition(
          enableHighAccuracy: false,
          timeout: new Duration(seconds: 1),
          maximumAge: Duration(hours: 1));
      if (a != null) {
        return GeolocationStatus.granted;
      } else {
        return GeolocationStatus.unknown;
      }
    }

    return _geo.checkGeolocationPermissionStatus();
  }

  Future<Position> getLastKnownPosition(
      {LocationAccuracy desiredAccuracy = LocationAccuracy.best,
      GeolocationPermission locationPermissionLevel =
          GeolocationPermission.location}) async {
    if (MPlatform.isWeb) {
      var a = await _wgeo.getCurrentPosition(
          enableHighAccuracy: false,
          timeout: new Duration(seconds: 1),
          maximumAge: Duration(days: 1));
      return new Position(
          latitude: a.coordinates.latitude, longitude: a.coordinates.longitude);
    }

    return _geo.getLastKnownPosition(
        desiredAccuracy: desiredAccuracy,
        locationPermissionLevel: locationPermissionLevel);
  }

  Future<Position> getCurrentPosition(
      {LocationAccuracy desiredAccuracy = LocationAccuracy.best,
      GeolocationPermission locationPermissionLevel =
          GeolocationPermission.location}) async {
    if (MPlatform.isWeb) {
      var a = await _wgeo.getCurrentPosition(
          enableHighAccuracy: false,
          timeout: new Duration(seconds: 1),
          maximumAge: Duration(hours: 1));
      return new Position(
          latitude: a.coordinates.latitude, longitude: a.coordinates.longitude);
    }

    return _geo.getCurrentPosition(
        desiredAccuracy: desiredAccuracy,
        locationPermissionLevel: locationPermissionLevel);
  }
}

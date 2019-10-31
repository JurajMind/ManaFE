import 'package:app/support/m_platform.dart';
import 'package:geolocator/geolocator.dart';

class MPosition {
  static MPosition _instance;
  static Geolocator _geo;

  factory MPosition() {
    if (_instance == null) {
      _geo = new Geolocator();
      _instance = new MPosition();
    }
    return _instance;
  }

  Future<GeolocationStatus> checkGeolocationPermissionStatus(
      {GeolocationPermission locationPermission =
          GeolocationPermission.location}) async {
    if (MPlatform.isWeb) return GeolocationStatus.granted;

    return _geo.checkGeolocationPermissionStatus();
  }

  Future<Position> getLastKnownPosition(
      {LocationAccuracy desiredAccuracy = LocationAccuracy.best,
      GeolocationPermission locationPermissionLevel =
          GeolocationPermission.location}) async {
    if (MPlatform.isWeb) return new Position(latitude: 50,longitude: 18);

    return _geo.getLastKnownPosition(
        desiredAccuracy: desiredAccuracy,
        locationPermissionLevel: locationPermissionLevel);
  }

    Future<Position> getCurrentPosition(
      {LocationAccuracy desiredAccuracy = LocationAccuracy.best,
      GeolocationPermission locationPermissionLevel =
          GeolocationPermission.location}) async {

             if (MPlatform.isWeb) return new Position(latitude: 50,longitude: 18);

    return _geo.getCurrentPosition(
        desiredAccuracy: desiredAccuracy,
        locationPermissionLevel: locationPermissionLevel);
          }
}

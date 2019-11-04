import 'package:app/support/m_platform.dart';
import 'package:geolocator/geolocator.dart';
import 'package:universal_html/prefer_sdk/html.dart' as html;

class MPosition {
  static Geolocator _geo;

  static final MPosition _instance = new MPosition._();

  factory MPosition() => MPosition._instance;

  MPosition._() {
    _geo = new Geolocator();
  }

  Future<GeolocationStatus> checkGeolocationPermissionStatus(
      {GeolocationPermission locationPermission =
          GeolocationPermission.location}) async {

    if (MPlatform.isWeb) {
          var position = await html.window.navigator.geolocation.getCurrentPosition();       
      if (position != null) {
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
    if (MPlatform.isWeb)
    {
       var position = await html.window.navigator.geolocation.getCurrentPosition();       
       return new Position(latitude: position.coords.latitude, longitude: position.coords.longitude);
    }
     

    return _geo.getLastKnownPosition(
        desiredAccuracy: desiredAccuracy,
        locationPermissionLevel: locationPermissionLevel);
  }

  Future<Position> getCurrentPosition(
      {LocationAccuracy desiredAccuracy = LocationAccuracy.best,
      GeolocationPermission locationPermissionLevel =
          GeolocationPermission.location}) async {
    if (MPlatform.isWeb)
    {
       var position = await html.window.navigator.geolocation.getCurrentPosition();       
       return new Position(latitude: position.coords.latitude, longitude: position.coords.longitude);
    }

    return _geo.getCurrentPosition(
        desiredAccuracy: desiredAccuracy,
        locationPermissionLevel: locationPermissionLevel);
  }
}

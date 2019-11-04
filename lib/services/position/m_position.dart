import 'package:app/support/m_platform.dart';
import 'package:geolocator/geolocator.dart';

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
    if (MPlatform.isWeb) return GeolocationStatus.granted;

    return _geo.checkGeolocationPermissionStatus();
  }

  Future<Position> getLastKnownPosition(
      {LocationAccuracy desiredAccuracy = LocationAccuracy.best,
      GeolocationPermission locationPermissionLevel =
          GeolocationPermission.location}) async {
    if (MPlatform.isWeb) return new Position(latitude: 50.08861,longitude: 14.42139);

    return _geo.getLastKnownPosition(
        desiredAccuracy: desiredAccuracy,
        locationPermissionLevel: locationPermissionLevel);
  }

    Future<Position> getCurrentPosition(
      {LocationAccuracy desiredAccuracy = LocationAccuracy.best,
      GeolocationPermission locationPermissionLevel =
          GeolocationPermission.location}) async {

             if (MPlatform.isWeb)  return new Position(latitude: 50.08861,longitude: 14.42139);

    return _geo.getCurrentPosition(
        desiredAccuracy: desiredAccuracy,
        locationPermissionLevel: locationPermissionLevel);
          }
}

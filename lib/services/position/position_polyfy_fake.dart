import 'dart:async';

class WGeolocation {
  Future<Position> getCurrentPosition(
      {bool enableHighAccuracy, Duration timeout, Duration maximumAge}) async {
    return new Position();
  }

  Stream<Position> watchPosition(
      {bool enableHighAccuracy, Duration timeout, Duration maximumAge}) {
    return Stream.empty();
  }
}

// proxy class
class Position {
 Coordinates get coordinates => new Coordinates();
}

class Coordinates {

  double get latitude => 0; 

  double get longitude => 0;
}


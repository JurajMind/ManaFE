import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:openapi/api.dart';
import 'package:queries/collections.dart';
import 'dart:math' show cos, sqrt, asin;

class PlaceHelpers {
  static bool isOpen(PlaceSimpleDto place) {
    try {
      if (place.businessHours == null) return null;
      if (place.businessHours.length == 0) return null;
      var today = Collection(place.businessHours)
          .firstOrDefault((a) => a.day == (DateTime.now().weekday - 1));
      if (today == null) return false;
      if (today.openTine == null || today.closeTime == null) return false;
      var now = DateTime.now();
      final DateFormat df = new DateFormat('HH:mm:ss');
      var open = df.parse(today.openTine);
      var close = df.parse(today.closeTime);
      open = DateTime(now.year, now.month, now.day, open.hour, open.minute);
      close = DateTime(now.year, now.month, now.day, close.hour, close.minute);
      if (close.compareTo(open) < 0) {
        close = close.add(Duration(days: 1));
      }
      if (open.compareTo(DateTime.now()) < 0 &&
          close.compareTo(DateTime.now()) > 0) {
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  static double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 6371 * asin(sqrt(a));
  }

  static double calculateDistanceFromAddress(
      AddressDto address, Position position) {
    var lat1 = double.tryParse(address.lat);
    var lon1 = double.tryParse(address.lng);
    if (lat1 != null && lon1 != null && position != null) {
      return calculateDistance(
          lat1, lon1, position.latitude, position.longitude);
    }
    return null;
  }
}

import 'package:intl/intl.dart';
import 'package:openapi/api.dart';
import 'package:queries/collections.dart';

class PlaceHelpers {
  static bool isOpen(PlaceSimpleDto place) {
    var today = Collection(place.businessHours)
        .firstOrDefault((a) => a.day == (DateTime.now().weekday - 1));
    if (today == null) return null;
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
  }
}

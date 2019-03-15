import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:openapi/api.dart';
import 'package:queries/collections.dart';

class OpenIndicator extends StatelessWidget {
  final PlaceSimpleDto place;
  final Size size;

  const OpenIndicator({Key key, this.place, this.size}) : super(key: key);

  bool _isOpen() {
    var today = Collection(place.businessHours)
        .firstOrDefault((a) => a.day == DateTime.now().weekday);
    if (today == null) return false;
    var now = DateTime.now();
    final DateFormat df = new DateFormat('HH:mm:ss');
    var open = df.parse(today.openTine);
    var close = df.parse(today.closeTime);
    open = DateTime(now.year, now.month, now.day, open.hour, open.minute);
    close = DateTime(now.year, now.month, now.day, close.hour, close.minute);
    if (close.compareTo(open) > 0) {
      close.add(Duration(days: 1));
    }
    if (open.compareTo(DateTime.now()) < 0 &&
        close.compareTo(DateTime.now()) > 0) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    var s = size ?? new Size.fromRadius(15);
    return Container(
      height: s.height,
      width: s.width,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: _isOpen() ? Colors.green : Colors.red),
    );
  }
}

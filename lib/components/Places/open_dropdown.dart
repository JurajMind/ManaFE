import 'package:app/Helpers/day_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:queries/collections.dart';
import 'package:queries/queries.dart';
import 'package:openapi/api.dart';

class OpenDropdown extends StatelessWidget {
  final PlaceSimpleDto place;
  final Size size;

  const OpenDropdown({Key key, this.place, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<int, String> days = new Map<int, String>();
    final DateFormat df = new DateFormat('HH:mm:ss');
    final DateFormat of = new DateFormat('HH:mm');

    for (int i = 1; i < 8; i++) {
      var day = new Collection(place.businessHours)
          .firstOrDefault((d) => d.day == i % 7);
      if (day == null) {
        days[i] = "${getShortDayName(i, context)} - closed";
      } else {
        var open = df.parse(day.openTine);
        var close = df.parse(day.closeTime);

        days[i] =
            "${getShortDayName(i, context)} ${of.format(open)}-${of.format(close)}";
      }
    }

    var s = size ?? new Size.fromRadius(15);
    return Container(
      child: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: new DropdownButton(
          iconSize: 20,
          value: days[DateTime.now().weekday],
          items: days.values.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(
                value,
                style: TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ),
    );
  }
}

import 'package:app/Helpers/day_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:queries/collections.dart';
import 'package:openapi/api.dart';

class OpenDropdown extends StatefulWidget {
  final PlaceSimpleDto place;
  final Size size;

  const OpenDropdown({Key key, this.place, this.size}) : super(key: key);

  @override
  _OpenDropdownState createState() => _OpenDropdownState();
}

class _OpenDropdownState extends State<OpenDropdown> {
  Map<int, String> days = new Map<int, String>();
  @override
  void initState() {
    super.initState();
    final DateFormat df = new DateFormat('HH:mm:ss');
    final DateFormat of = new DateFormat('HH:mm');

    new Future.delayed(Duration.zero, () {
      var result = new Map<int, String>();
      for (int i = 1; i < 8; i++) {
        var day = new Collection(widget.place.businessHours)
            .firstOrDefault((d) => d.day == i - 1);
        if (day == null) {
          result[i] = "${getShortDayName(i, context)} - closed";
        } else {
          var open = df.parse(day.openTine);
          var close = df.parse(day.closeTime);

          result[i] =
              "${getShortDayName(i, context)} ${of.format(open)}-${of.format(close)}";
        }
      }

      setState(() {
        days = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var s = widget.size ?? new Size.fromRadius(15);

    if (widget.place.businessHours.length == 0) {
      return Text(
        'Unknown',
        style: TextStyle(color: Colors.black),
      );
    }

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

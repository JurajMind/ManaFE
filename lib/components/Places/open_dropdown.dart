import 'package:app/Helpers/day_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:queries/collections.dart';
import 'package:openapi/api.dart';

class OpenDropdown extends StatefulWidget {
  final PlaceSimpleDto place;
  final List<BusinessHoursDto> hours;
  final Size size;
  final bool dark;

  const OpenDropdown(
      {Key key, this.place, this.size, this.hours, this.dark = false})
      : super(key: key);

  @override
  _OpenDropdownState createState() => _OpenDropdownState();
}

class _OpenDropdownState extends State<OpenDropdown> {
  Map<int, String> days = new Map<int, String>();
  List<BusinessHoursDto> bh;
  final DateFormat df = new DateFormat('HH:mm:ss');
  final DateFormat of = new DateFormat('HH:mm');
  @override
  void initState() {
    super.initState();

    if (widget.place != null) {
      bh = widget.place.businessHours;
    }

    if (widget.hours != null) {
      bh = widget.hours;
    }

    new Future.delayed(Duration.zero, () {
      parseState(bh);
    });
  }

  void parseState(List<BusinessHoursDto> hours) {
    var result = new Map<int, String>();
    for (int i = 1; i < 8; i++) {
      var day = new Collection(hours).firstOrDefault((d) => d.day == (i) % 7);
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
  }

  @override
  void didUpdateWidget(OpenDropdown oldWidget) {
    if (oldWidget.hours != widget.hours) {
      if (widget.place != null) {
        bh = widget.place.businessHours;
      }

      if (widget.hours != null) {
        bh = widget.hours;
      }
      parseState(bh);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (bh == null || bh.length == 0) {
      return Text(
        'Unknown',
        style: TextStyle(color: Colors.black),
      );
    }

    return Container(
      child: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: widget.dark ? Colors.black : Colors.white),
        child: new DropdownButton(
          iconSize: 20,
          value: days[DateTime.now().weekday],
          items: days.values.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(
                value,
                style:
                    TextStyle(color: widget.dark ? Colors.white : Colors.black),
              ),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ),
    );
  }
}

import 'package:app/Helpers/place_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:openapi/api.dart';
import 'package:queries/collections.dart';

class OpenIndicator extends StatefulWidget {
  final PlaceSimpleDto place;
  final Size size;

  const OpenIndicator({Key key, this.place, this.size}) : super(key: key);

  @override
  _OpenIndicatorState createState() => _OpenIndicatorState();
}

class _OpenIndicatorState extends State<OpenIndicator> {
  bool isOpen;

  @override
  void initState() {
    isOpen = PlaceHelpers.isOpen(widget.place);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var s = widget.size ?? new Size.fromRadius(15);
    if (widget.place.businessHours.length == 0 || isOpen == null) {
      return Container(
        height: s.height,
        width: s.width,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
      );
    }

    return Container(
      height: s.height,
      width: s.width,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: isOpen ? Colors.green : Colors.red),
    );
  }
}

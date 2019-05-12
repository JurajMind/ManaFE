import 'dart:math';

import 'package:app/app/app.dart';
import 'package:app/support/validators/base.validator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Let's validate!
String validate(
    Object value, String attribute, List<BaseValidator> validators) {
  String result;

  // Continue test while if result is null.
  validators.takeWhile((BaseValidator validator) {
    return result == null;
  }).forEach((BaseValidator validator) {
    result = validator.validate(value, attribute);
  });

  return result;
}

// Navigate
void navigate(BuildContext context, String routePath,
    {Map<String, dynamic> params}) {
  App.router.navigateTo(context, routePath);
}

// Redirect
void redirect(BuildContext context, String routePath) {
  Navigator.pushReplacementNamed(context, routePath);
}

//CircleRadius
double getCircleRadius(BuildContext context) {
  return MediaQuery.of(context).size.width / 1.8;
}

String slotDurationString(int slots) {
  var minutes = slots * 30;
  final DateFormat of = new DateFormat('HH:mm');
  var duration = new Duration(minutes: minutes);
  return "${minutes ~/ 60}:${(minutes % 60)}${minutes % 60 == 0 ? "0" : ""}";
}

int compareDate(DateTime a, DateTime b) {
  var d1 = DateTime.utc(a.year, a.month, a.day);
  var d2 = DateTime.utc(b.year, b.month, b.day); //you can add today's date here
  return d1.compareTo(d2);
}

bool isTablet(MediaQueryData query) {
  var size = query.size;
  var diagonal = sqrt((size.width * size.width) + (size.height * size.height));

  /*
    print(
      'size: ${size.width}x${size.height}\n'
      'pixelRatio: ${query.devicePixelRatio}\n'
      'pixels: ${size.width * query.devicePixelRatio}x${size.height * query.devicePixelRatio}\n'
      'diagonal: $diagonal'
    );
    */

  var isTablet = diagonal > 1100.0;
  return isTablet;
}

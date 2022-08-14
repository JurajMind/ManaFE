import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';

String getShortDayName(int dayOfWeekk, BuildContext context) {
  var translation = AppTranslations.of(context)?.text("days.short_$dayOfWeekk");
  return translation ?? 'missing';
}

String getLongDayName(int dayOfWeekk, BuildContext context) {
  var translation = AppTranslations.of(context)?.text("days.long_$dayOfWeekk");
  return translation ?? 'missing';
}

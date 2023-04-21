import 'dart:async';

import 'package:alice_lightweight/alice.dart';
import 'package:app/app/app.dart';
import 'package:app/main.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/pages/Start/start.page.dart';
import 'package:app/pages/home.page.dart';
import 'package:app/services/authorization.dart';
import 'package:app/theme/theme_widget.dart';
import 'package:app/utils/translations/app_translations_delegate.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import '../pages/Start/start.page_freya.dart';
import '../theme/theme_data.dart';
import 'app.widget.dart';
//

final navigatorKey = new GlobalKey<NavigatorState>();

class FreyaAppWidget extends AppWidget {
  @override
  State<StatefulWidget> createState() {
    return new FreyaAppState();
  }
}

class FreyaAppState extends AppWidgetState {
  @override
  String get title => 'Freya';

  ThemeData getTheme(MThemeData theme) {
    return MTheme.buildFreyaTheme(theme);
  }

  Widget get startPage => FreyaStartPage();
}

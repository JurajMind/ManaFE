
import 'package:app/theme/theme_widget.dart';
import 'package:flutter/material.dart';


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

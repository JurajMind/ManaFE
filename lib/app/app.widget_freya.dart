import 'package:app/theme/theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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

  Widget get startPage => NeumorphicTheme(
      themeMode: ThemeMode.dark, //or dark / system
      darkTheme: NeumorphicThemeData(
        baseColor: Color(0xff333333),
        accentColor: Colors.green,
        lightSource: LightSource.topLeft,
        depth: 4,
        intensity: 0.3,
      ),
      theme: NeumorphicThemeData(
        baseColor: Color(0xffDDDDDD),
        accentColor: Colors.cyan,
        lightSource: LightSource.topLeft,
        depth: 6,
        intensity: 0.5,
      ),
      child: FreyaStartPage());
}

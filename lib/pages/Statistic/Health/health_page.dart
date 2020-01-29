import 'package:app/const/theme.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

import 'Components/carbon_monoxid_widget.dart';
import 'Components/last_hookah_widget.dart';
import 'Components/nicotine_intake_widget.dart';
import 'Components/session_time_widget.dart';
import 'Components/smoke_intake_widget.dart';

class HealthPage extends StatefulWidget {
  final DateTime from;
  final DateTime to;
  HealthPage({Key key, this.from, this.to}) : super(key: key);

  _HealthPageState createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  @override
  Widget build(BuildContext context) {
    var statBloc = DataProvider.getData(context).statisticBloc;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: Text(AppTranslations.of(context).text('health.title')),
        centerTitle: true,
      ),
      body: StreamBuilder<List<SmokeSessionSimpleDto>>(
          stream: statBloc.smokeSessions,
          initialData: null,
          builder: (context, snapshot) {
            return ListView(
              children: <Widget>[
                const SessionTimeWidget(),
                const LastHookahWidget(),
                new CarbonMonoxideWidget(widget.from, widget.to),
                const SmokeIntakeWidget(),
                const NicotineIntakeWidget(),
                SizedBox(
                  height: 100,
                )
              ],
            );
          }),
    );
  }
}

import 'package:app/components/Charts/gauge.dart';
import 'package:app/const/theme.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:charts_common/common.dart' as chart;
import 'package:openapi/api.dart';

import 'Components/carbon_monoxid_widget.dart';
import 'Components/last_hookah_widget.dart';
import 'Components/nicotine_intake_widget.dart';
import 'Components/session_time_widget.dart';
import 'Components/smoke_intake_widget.dart';
import 'Components/smoke_view.dart';

class HealthPage extends StatefulWidget {
  final DateTime from;
  final DateTime to;
  HealthPage({Key key, this.from, this.to}) : super(key: key);

  _HealthPageState createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  static List<Series<GaugeSegment, String>> _createSampleData() {
    final data = [
      new GaugeSegment('Low', 100),
      new GaugeSegment('Acceptable', 75),
      new GaugeSegment('High', 50),
      new GaugeSegment('Highly Unusual', 25),
    ];

    final colors = [
      chart.Color.fromHex(code: "#00CA43"),
      chart.Color.fromHex(code: "#ECFF33"),
      chart.Color.fromHex(code: "#FFBB33"),
      chart.Color.fromHex(code: "#FF5733"),
    ];

    return [
      new Series<GaugeSegment, String>(
        id: 'Segments',
        domainFn: (GaugeSegment segment, _) => segment.segment,
        measureFn: (GaugeSegment segment, _) => segment.size,
        colorFn: (GaugeSegment segment, index) => colors[index],
        data: data,
      )
    ];
  }

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

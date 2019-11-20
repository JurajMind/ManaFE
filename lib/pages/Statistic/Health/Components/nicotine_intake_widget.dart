import 'package:app/components/Charts/gauge.dart';
import 'package:app/const/theme.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:charts_common/common.dart' as chart;

class NicotineIntakeWidget extends StatelessWidget {
  const NicotineIntakeWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              AppTranslations.of(context).text('health.nicotine'),
              style: Theme.of(context).textTheme.display1,
            ),
            SizedBox(
              height: 10,
            ),
            Text(AppTranslations.of(context).text('health.nicotine_text')),
            Container(
              height: 200,
              child: GaugeChart(_createSampleData(),
                  minValue: 0,
                  value: 3.6,
                  maxValue: 10,
                  handColor: AppColors.colors[0]),
            )
          ],
        ),
      ),
    );
  }

  List<Series<GaugeSegment, String>> _createSampleData() {
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
}

import 'dart:async';

import 'package:app/const/theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'dart:math' as math;

import '../detail_page_helper.dart';
import 'indicator.dart';

class SmokeProgressGraph extends StatefulWidget {
  final List<SmartHookahModelsDbPuf>? data;

  const SmokeProgressGraph(this.data, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SmokeProgressGraphState();
}

class SmokeProgressGraphState extends State<SmokeProgressGraph> {
  List<FlSpot>? inList;
  List<FlSpot>? outList;
  double maxY = 0;

  late StreamController<LineTouchResponse> controller;
  @override
  void initState() {
    super.initState();
    var processData = DetailPageHelper.createHistogram(widget.data!, 300);
    controller = StreamController();
    inList = <FlSpot>[];
    outList = <FlSpot>[];
    for (int i = 0; i < processData.length; i++) {
      var intakes = processData[i].where((test) => test.T == 1).length;
      var outTakes = processData[i].where((test) => test.T == 2).length;
      inList!.add(new FlSpot(i + 0.0, intakes + 0.0));
      outList!.add(new FlSpot(i + 0.0, outTakes + 0.0));
      var lm = math.max(intakes, outTakes);
      maxY = math.max(maxY, lm + 0.0);
    }

    controller.stream.distinct().listen((LineTouchResponse response) {});
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            gradient: LinearGradient(
              colors: [
                Color(0xff2c274c),
                Color(0xff46426c),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 4,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.multiline_chart),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Progress",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 18,
                  ),
                  Indicator(
                    color: AppColors.colors[0],
                    text: "Puffs",
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: AppColors.colors[1],
                    text: "Blows",
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                  child: LineChart(
                    LineChartData(
                      lineTouchData: LineTouchData(
                          touchTooltipData: LineTouchTooltipData(
                        tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
                      )),
                      gridData: FlGridData(
                        show: false,
                      ),
                      borderData: FlBorderData(
                          show: true,
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xff4e4965),
                              width: 4,
                            ),
                            left: BorderSide(
                              color: Colors.transparent,
                            ),
                            right: BorderSide(
                              color: Colors.transparent,
                            ),
                            top: BorderSide(
                              color: Colors.transparent,
                            ),
                          )),
                      minX: 0,
                      maxX: inList!.length + 0.0,
                      maxY: maxY * 1.2,
                      minY: 0,
                      lineBarsData: [
                        if (inList != null && inList!.length > 0)
                          LineChartBarData(
                            spots: [...inList!],
                            isCurved: true,
                            color: AppColors.colors[0],
                            barWidth: 8,
                            isStrokeCapRound: true,
                            dotData: FlDotData(
                              show: false,
                            ),
                            belowBarData: BarAreaData(
                              show: true,
                            ),
                          ),
                        if (outList != null && outList!.length > 0)
                          LineChartBarData(
                            spots: [...outList!],
                            isCurved: true,
                            color: AppColors.colors[1],
                            barWidth: 8,
                            isStrokeCapRound: true,
                            dotData: FlDotData(
                              show: false,
                            ),
                            belowBarData: BarAreaData(
                              show: true,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.close();
  }
}

class SmokeProgressGraphShimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.23,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff2c274c),
                    Color(0xff46426c),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                )),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.multiline_chart),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Progress",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              ]),
            )));
  }
}

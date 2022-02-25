import 'dart:async';

import 'package:app/const/theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:darq/darq.dart';

import 'indicator.dart';

class SmokeDurationGraph extends StatefulWidget {
  final List<Duration> idleDurations;
  final List<Duration> inDurations;
  final List<Duration> outDurations;

  const SmokeDurationGraph({Key key, this.idleDurations, this.inDurations, this.outDurations}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SmokeDurationGraphState();
}

class _SmokeDurationGraphState extends State<SmokeDurationGraph> {
  List<PieChartSectionData> pieChartRawSections;
  List<PieChartSectionData> showingSections;

  StreamController<PieTouchResponse> pieTouchedResultStreamController;

  int touchedIndex;

  @override
  void initState() {
    var inMilis = widget.inDurations?.sum<int>((s) => s.inMilliseconds)?.toInt() ?? 0;
    var outMilis = widget.outDurations?.sum<int>((s) => s.inMilliseconds)?.toInt() ?? 0;
    var idleMilis = widget.idleDurations?.sum<int>((s) => s.inMilliseconds)?.toInt() ?? 0;
    var all = (inMilis + outMilis + idleMilis);

    final section1 = PieChartSectionData(
      color: AppColors.colors[0],
      value: inMilis / all,
      title: ((inMilis / all) * 100).toStringAsFixed(1) + '%',
      radius: 50,
      titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffffffff)),
    );

    final section2 = PieChartSectionData(
      color: AppColors.colors[1],
      value: outMilis / all,
      title: ((outMilis / all) * 100).toStringAsFixed(1) + '%',
      radius: 50,
      titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffffffff)),
    );

    final section3 = PieChartSectionData(
      color: AppColors.colors[2],
      value: idleMilis / all,
      title: ((idleMilis / all) * 100).toStringAsFixed(1) + '%',
      radius: 50,
      titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffffffff)),
    );

    final items = [
      section1,
      section2,
      section3,
    ];

    pieChartRawSections = items;

    showingSections = pieChartRawSections;

    pieTouchedResultStreamController = StreamController();
    pieTouchedResultStreamController.stream.distinct().listen((details) {
      if (details == null) {
        return;
      }

      touchedIndex = -1;
      if (details.touchedSection != null) {
        //  touchedIndex = showingSections.indexOf(details.touchedSection);
      }

      setState(() {
        if (details is dynamic) {
          touchedIndex = -1;
          showingSections = List.of(pieChartRawSections);
        } else {
          showingSections = List.of(pieChartRawSections);

          if (touchedIndex != -1) {
            final TextStyle style = showingSections[touchedIndex].titleStyle;
            showingSections[touchedIndex] = showingSections[touchedIndex].copyWith(
              titleStyle: style.copyWith(
                fontSize: 24,
              ),
              radius: 60,
            );
          }
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useTabletLayout = shortestSide > 600;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 1.3,
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.pie_chart),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Distribution",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: PieChart(
                            PieChartData(
                                sectionsSpace: 0,
                                centerSpaceRadius: useTabletLayout ? 160 : 40,
                                sections: showingSections),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
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
                            height: 4,
                          ),
                          Indicator(
                            color: AppColors.colors[2],
                            text: "Idle",
                            isSquare: true,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          SizedBox(
                            height: 18,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 28,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SmokeDurationGraphShimer extends StatelessWidget {
  const SmokeDurationGraphShimer({Key key}) : super(key: key);

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
                    Icon(Icons.pie_chart),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Distribution",
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

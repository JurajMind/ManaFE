import 'dart:async';

import 'package:app/const/theme.dart';
import 'package:app/module/person/statistic_bloc.dart';
import 'package:app/support/m_platform.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:openapi/api.dart';

class WeekDayGraph extends StatefulWidget {
  final Map<String, int> graphData;

  const WeekDayGraph({Key key, this.graphData}) : super(key: key);

  @override
  State<StatefulWidget> createState() => WeekDayGraphState();
}

class WeekDayGraphState extends State<WeekDayGraph> {
  final Color barBackgroundColor = Colors.red;
  final Color barColor = Colors.white;
  final double width = 10;
  double max = 0;
  Map<String, int> graphData;

  List<BarChartGroupData> rawBarGroups;
  List<BarChartGroupData> showingBarGroups;

  StreamController<BarTouchResponse> barTouchedResultStreamController;

  int touchedGroupIndex;

  @override
  void initState() {
    super.initState();
    graphData = widget.graphData;
    var items = mapData(graphData);
    rawBarGroups = items;

    showingBarGroups = rawBarGroups;

    barTouchedResultStreamController = StreamController();
    barTouchedResultStreamController.stream
        .distinct()
        .listen((BarTouchResponse response) {
      if (response == null) {
        return;
      }

      if (response?.spot == null) {
        setState(() {
          touchedGroupIndex = -1;
          showingBarGroups = List.of(rawBarGroups);
        });
        return;
      }

      touchedGroupIndex =
          showingBarGroups.indexOf(response?.spot?.touchedBarGroup);

      setState(() {
        if (response.touchInput is dynamic) {
          touchedGroupIndex = -1;
          showingBarGroups = List.of(rawBarGroups);
        } else {
          showingBarGroups = List.of(rawBarGroups);
          if (touchedGroupIndex != -1) {
            showingBarGroups[touchedGroupIndex] =
                showingBarGroups[touchedGroupIndex].copyWith(
              barRods: showingBarGroups[touchedGroupIndex].barRods.map((rod) {
                return rod
                    .copyWith(colors: [AppColors.colors[3]], y: rod.y + 1);
              }).toList(),
            );
          }
        }
      });
    });
  }

  @override
  void didUpdateWidget(WeekDayGraph oldWidget) {
    if (oldWidget.graphData != widget.graphData) {
      var items = mapData(widget.graphData);
      setState(() {
        rawBarGroups = items;
        showingBarGroups = rawBarGroups;
      });
      super.didUpdateWidget(oldWidget);
    }
  }

  @override
  void didChangeDependencies() {
    List<BarChartGroupData> items = mapData(widget.graphData);

    setState(() {
      rawBarGroups = items;
      showingBarGroups = rawBarGroups;
    });
    super.didChangeDependencies();
  }

  List<BarChartGroupData> mapData(Map<String, int> graphData) {
    max = 0;
    final items = graphData.map((d, v) {
      var day = int.parse(d);
      var value = v + 0.0;
      max = math.max(max, value);
      var data = makeGroupData(day, value);
      return MapEntry(d, data);
    }).values;

    return items.toList();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.calendar_today),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    AppTranslations.of(context).text('profile.week_days'),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              SizedBox(
                height: 38,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: BarChart(BarChartData(
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: Colors.blueGrey,
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: SideTitles(
                          showTitles: true,
                          margin: 16,
                          getTitles: (double value) {
                            return AppTranslations.of(context)
                                .text("days.short_${value.toInt() + 1}");
                          }),
                      leftTitles: SideTitles(
                        showTitles: true,
                        margin: 32,
                        reservedSize: 14,
                        getTitles: (value) {
                          if (max < 5) {
                            if (value % 2 == 0) return value.toStringAsFixed(0);
                          }

                          if (max < 20) {
                            if (value % 5 == 0) return value.toStringAsFixed(0);
                          }

                          if (max < 50) {
                            if (value % 10 == 0)
                              return value.toStringAsFixed(0);
                          }

                          if (max < 100) {
                            if (value % 20 == 0)
                              return value.toStringAsFixed(0);
                          }

                          if (max < 200) {
                            if (value % 40 == 0)
                              return value.toStringAsFixed(0);
                          }

                          if (max < 1000) {
                            if (value % 100 == 0)
                              return value.toStringAsFixed(0);
                          }

                          return '';
                        },
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    barGroups: showingBarGroups,
                  )),
                ),
              ),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(
        y: y,
        colors: [AppColors.colors[1]],
        width: width,
        backDrawRodData: BackgroundBarChartRodData(
            show: true, y: max < 5 ? 5 : max + 0.0, colors: [Colors.black]),
      ),
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    barTouchedResultStreamController.close();
  }
}

class WeekDayGraphStream extends StatelessWidget {
  const WeekDayGraphStream({
    Key key,
    @required this.bloc,
  }) : super(key: key);

  final StatisticBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<PersonStatisticsOverallDto>(
          stream: bloc.statistic,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container();
            }
            var seriesList = snapshot.data.timeStatistics.dayOfWeekDistribution;
            return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: 250,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: WeekDayGraph(
                      graphData: seriesList,
                    ),
                  ),
                ));
          }),
    );
  }
}

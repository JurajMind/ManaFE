import 'dart:async';

import 'package:app/const/theme.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:queries/collections.dart';
import 'dart:math' as math;

class SessionDayGraph extends StatefulWidget {
  final Map<String, int> graphData;

  const SessionDayGraph(this.graphData, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SessionDayGraphState();
}

class SessionDayGraphState extends State<SessionDayGraph> {
  final Color barBackgroundColor = Colors.red;
  final Color barColor = Colors.white;
  final double width = 5;
  int max = 0;

  List<BarChartGroupData> rawBarGroups;
  List<BarChartGroupData> showingBarGroups;

  StreamController<BarTouchResponse> barTouchedResultStreamController;

  int touchedGroupIndex;

  @override
  void didUpdateWidget(SessionDayGraph oldWidget) {
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

  List<BarChartGroupData> mapData(Map<String, int> data) {
    if (data == null) {}
    max = 0;
    var parsedData = data.map((k, v) => MapEntry(int.parse(k), v));
    for (int i = 0; i < 24; i++) {
      if (parsedData[i] == null) {
        parsedData[i] = 0;
      } else {
        max = math.max(max, parsedData[i]);
      }
    }

    final items = parsedData
        .map((k, v) {
          var data = makeGroupData(k, v + 0.0);
          return MapEntry(k, data);
        })
        .values
        .toList();

    var cItems = Collection(items);

    return cItems.orderBy((a) => a.x).toList();
  }

  @override
  void initState() {
    super.initState();

    List<BarChartGroupData> items = mapData(widget.graphData);
    rawBarGroups = items;

    showingBarGroups = rawBarGroups;

    barTouchedResultStreamController = StreamController();
    barTouchedResultStreamController.stream
        .distinct()
        .listen((BarTouchResponse response) {
      if (response == null) {
        return;
      }

      if (response.spot == null) {
        setState(() {
          touchedGroupIndex = -1;
          showingBarGroups = List.of(rawBarGroups);
        });
        return;
      }

      touchedGroupIndex =
          showingBarGroups.indexOf(response.spot.touchedBarGroup);

      setState(() {
        if (response.touchInput is FlLongPressEnd) {
          touchedGroupIndex = -1;
          showingBarGroups = List.of(rawBarGroups);
        } else {
          showingBarGroups = List.of(rawBarGroups);
          if (touchedGroupIndex != -1) {
            showingBarGroups[touchedGroupIndex] =
                showingBarGroups[touchedGroupIndex].copyWith(
              barRods: showingBarGroups[touchedGroupIndex].barRods.map((rod) {
                return rod.copyWith(color: AppColors.colors[3], y: rod.y + 1);
              }).toList(),
            );
          }
        }
      });
    });
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
                  Icon(Icons.timer),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    AppTranslations.of(context).text('profile.session_times'),
                    style: Theme.of(context).textTheme.display1,
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              SizedBox(
                height: 28,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: FlChart(
                    chart: BarChart(BarChartData(
                      barTouchData: BarTouchData(
                        touchTooltipData: TouchTooltipData(
                            tooltipBgColor: Colors.blueGrey,
                            getTooltipItems: (touchedSpots) {
                              return touchedSpots.map((touchedSpot) {
                                if (touchedSpot.spot == null) {
                                  return "";
                                }
                                String weekDay =
                                    touchedSpot.spot.x.toInt().toString();
                                return TooltipItem(
                                    weekDay +
                                        '\n' +
                                        touchedSpot.spot.y.toString(),
                                    TextStyle(color: Colors.yellow));
                              }).toList();
                            }),
                        touchResponseSink:
                            barTouchedResultStreamController.sink,
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: SideTitles(
                            showTitles: true,
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            margin: 16,
                            getTitles: (double value) {
                              var intValue = value.toInt();
                              if (intValue % 3 == 0) return intValue.toString();
                              return '';
                            }),
                        leftTitles: SideTitles(
                          showTitles: true,
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                          margin: 16,
                          reservedSize: 10.0,
                          getTitles: (value) {
                            if (max < 5) {
                              if (value % 2 == 0)
                                return value.toStringAsFixed(0);
                            }

                            if (max < 20) {
                              if (value % 5 == 0)
                                return value.toStringAsFixed(0);
                            }

                            if (max < 50) {
                              if (value % 10 == 0)
                                return value.toStringAsFixed(0);
                            }

                            if (max < 100) {
                              if (value % 20 == 0)
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
              ),
              SizedBox(
                height: 8,
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
        color: AppColors.colors[2],
        width: width,
        isRound: true,
        backDrawRodData: BackgroundBarChartRodData(
            show: true, y: max == 0 ? 20 : max + 0.0, color: Colors.black),
      ),
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    barTouchedResultStreamController.close();
  }
}

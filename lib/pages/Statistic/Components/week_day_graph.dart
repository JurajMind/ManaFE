import 'dart:async';

import 'package:app/const/theme.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeekDayGraph extends StatefulWidget {
  final Map<String, int> graphData;

  const WeekDayGraph({Key key, this.graphData}) : super(key: key);

  @override
  State<StatefulWidget> createState() => WeekDayGraphState();
}

class WeekDayGraphState extends State<WeekDayGraph> {
  final Color barBackgroundColor = Colors.red;
  final Color barColor = Colors.white;
  final double width = 22;
  Map<String, int> graphData;

  List<BarChartGroupData> rawBarGroups;
  List<BarChartGroupData> showingBarGroups;

  StreamController<BarTouchResponse> barTouchedResultStreamController;

  int touchedGroupIndex;

  @override
  void initState() {
    super.initState();
    graphData = widget.graphData;
    var items = makeData(graphData);
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    var items = makeData(graphData);

    setState(() {
      rawBarGroups = items;

      showingBarGroups = rawBarGroups;
    });
  }

  @override
  void didUpdateWidget(WeekDayGraph oldWidget) {
    if (oldWidget.graphData != graphData) {
      var items = makeData(widget.graphData);
      graphData = widget.graphData;
      setState(() {
        rawBarGroups = items;

        showingBarGroups = rawBarGroups;
      });
      super.didUpdateWidget(oldWidget);
    }
  }

  List<BarChartGroupData> makeData(Map<String, int> graphData) {

    final items = 
      graphData.map((d,v){
        var day = int.parse(d);
        var value = v + 0.0;
        var data = makeGroupData(day, value);
        return MapEntry(d,data);
      }).values;
    ;

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
                    "Week days",
                    style: Theme.of(context).textTheme.display1,
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
                  child: FlChart(
                    chart: BarChart(BarChartData(
                      barTouchData: BarTouchData(
                        touchTooltipData: TouchTooltipData(
                            tooltipBgColor: Colors.blueGrey,
                            getTooltipItems: (touchedSpots) {
                              return touchedSpots.map((touchedSpot) {
                                String weekDay;
                                weekDay = AppTranslations.of(context).text(
                                    "days.long_${touchedSpot.spot.x.toInt() + 1}");
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
                              return AppTranslations.of(context)
                                  .text("days.short_${value.toInt() + 1}");
                            }),
                        leftTitles: SideTitles(
                          showTitles: true,
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                          margin: 32,
                          reservedSize: 14,
                          getTitles: (value) {
                            if (value == 0) {
                              return '1K';
                            } else if (value == 10) {
                              return '5K';
                            } else if (value == 19) {
                              return '10K';
                            } else {
                              return '';
                            }
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
        color: AppColors.colors[1],
        width: width,
        isRound: true,
        backDrawRodData:
            BackgroundBarChartRodData(show: true, y: 20, color: Colors.black),
      ),
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    barTouchedResultStreamController.close();
  }
}

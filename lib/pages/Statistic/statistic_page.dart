import 'package:app/Helpers/day_helper.dart';
import 'package:app/app/app.widget.dart';
import 'package:app/components/Buttons/roundedButton.dart';
import 'package:app/components/SmokeSession/smoke_session_list_item.dart';
import 'package:app/components/Statistic/recap.dart';
import 'package:app/const/theme.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/person/statistic_bloc.dart';
import 'package:app/pages/Places/places_map_page.dart';
import 'package:app/pages/Settings/language_selector_page.dart';
import 'package:app/pages/Statistic/Components/gear_usage_item.dart';
import 'package:app/pages/Statistic/all_statistic_page.dart';
import 'package:app/pages/Statistic/test_page.dart';
import 'package:app/services/authorization.dart';
import 'package:app/support/mana_icons_icons.dart';
import 'package:app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:app/components/Charts/sparkline.dart';
import 'package:openapi/api.dart';
import 'package:queries/collections.dart';
import 'dart:math' as math;
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:shimmer/shimmer.dart';

class StatisticPage extends StatefulWidget {
  @override
  State<StatisticPage> createState() => new _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  math.Random random = new math.Random();
  PageController controller;
  Authorize auth = new Authorize();
  String selectedTime = "Year";
  bool loading = false;
  @override
  initState() {
    super.initState();
    controller = new PageController(
        initialPage: 0, keepPage: true, viewportFraction: 0.9);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = DataProvider.getData(context).statisticBloc;
    return new Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
              new PopupMenuButton(
                onSelected: (String value) {
                  switch (value) {
                    case 'settings':
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LanguageSelectorPage()));
                      break;
                    case 'signOut':
                      auth.signOut();
                      AppWidget.restartApp(context);
                      break;
                    case 'test':
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => StatisticPage()));
                      break;
                    case 'testPage':
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => TestPage()));
                      break;
                    case 'testPlaces':
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PlacesMapPage()));
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        value: "settings",
                        child: Text('Settings'),
                      ),
                      PopupMenuItem(
                        value: "signOut",
                        child: Text('Sign out'),
                      ),
                      PopupMenuItem(
                        value: "test",
                        child: Text('Design statistic'),
                      ),
                      PopupMenuItem(
                        value: "testPage",
                        child: Text('Test page'),
                      ),
                      PopupMenuItem(
                        value: "testPlaces",
                        child: Text('Test places'),
                      )
                    ],
              )
            ],
            backgroundColor: Colors.black,
            pinned: true,
            expandedHeight: 300.0,
            automaticallyImplyLeading: true,
            primary: true,
            flexibleSpace: new FlexibleSpaceBar(
              background: Stack(
                children: <Widget>[
                  buildPositioned(bloc, 1, (f) => f.pufCount.toDouble()),
                  buildPositioned(bloc, 0, (f) => f.smokeSessions.toDouble()),
                  buildPositioned(bloc, 2, (f) => f.activity.toDouble()),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size(700, 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: new TimeSelect(
                        label: 'Week',
                        selected: selectedTime == 'Week',
                        onTap: () =>
                            loadTime(bloc, new Duration(days: 7), "Week"),
                      )),
                  Expanded(
                      flex: 1,
                      child: new TimeSelect(
                        label: 'Month',
                        selected: selectedTime == 'Month',
                        onTap: () =>
                            loadTime(bloc, new Duration(days: 31), "Month"),
                      )),
                  Expanded(
                      flex: 1,
                      child: new TimeSelect(
                        label: 'Year',
                        selected: selectedTime == 'Year',
                        onTap: () =>
                            loadTime(bloc, new Duration(days: 365), "Year"),
                      )),
                  Expanded(flex: 1, child: new TimeSelect(label: 'Custom')),
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            StreamBuilder<StatisticRecap>(
                                stream: bloc.recap,
                                builder: (context, snapshot) {
                                  return snapshot.data?.sessionCount == null
                                      ? Shimmer.fromColors(
                                          baseColor: Colors.grey[400],
                                          highlightColor: Colors.white,
                                          child: Text(
                                            "??",
                                            style: Theme.of(context)
                                                .textTheme
                                                .title,
                                          ),
                                        )
                                      : Text(
                                          snapshot.data.sessionCount.toString(),
                                          style:
                                              Theme.of(context).textTheme.title,
                                        );
                                }),
                            Icon(
                              ManaIcons.hookah,
                              size: 40,
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
            title: Container(
                child: Row(
              children: <Widget>[
                Text(
                  'STATS',
                  style: Theme.of(context).textTheme.title,
                ),
                this.loading ? CircularProgressIndicator() : Container()
              ],
            )),
          ),
          new SliverList(
            delegate: SliverChildListDelegate(buildBody(bloc)),
          )
        ],
      ),
    );
  }

  loadTime(StatisticBloc bloc, Duration duration, String label) {
    setState(() {
      this.loading = true;
    });
    bloc
        .loadStatistic(DateTime.now().subtract(duration), DateTime.now())
        .then((_) {
      setState(() {
        this.selectedTime = label;
        this.loading = false;
      });
    });
  }

  List<Widget> buildBody(StatisticBloc bloc) {
    var result = new List<Widget>();
    result.add(buildStatRecap(bloc));
    result.add(buildGearUsage(bloc));
    result.add(buildTimeStatistic(bloc));
    result.add(buildDayStatistic(bloc));
    result.add(SizedBox(height: 10));
    result.addAll(buildSmokeSession(bloc));
    result.add(SizedBox(
      height: 70,
    ));
    return result;
  }

  List<Widget> buildSmokeSession(StatisticBloc bloc) {
    var result = new List<Widget>();
    result.add(Center(
      child: new Text(
        'Smoke sessions',
        style: Theme.of(context).textTheme.display2,
      ),
    ));
    result.add(StreamBuilder<List<SmokeSessionSimpleDto>>(
        stream: bloc.smokeSessions,
        initialData: null,
        builder: (BuildContext context,
            AsyncSnapshot<List<SmokeSessionSimpleDto>> snapshot) {
          if (snapshot.data == null) {
            return Placeholder();
          }

          List<Widget> sessions = snapshot.data
              .map((f) {
                return SmokeSessionListItem(session: f);
              })
              .take(5)
              .cast<Widget>()
              .toList();
          sessions.add(
            OutlineButton.icon(
              borderSide: BorderSide(color: Colors.white),
              icon: Icon(
                Icons.clear_all,
                color: Colors.red,
              ),
              label: Text('All sessions (${snapshot.data.length})'),
              onPressed: () async {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) =>
                        AllStatisticPage(seed: snapshot.data)));
              },
            ),
          );

          return Column(children: sessions);
        }));
    return result;
  }

  Widget buildGearUsage(StatisticBloc bloc) {
    return Container(
      height: 400,
      width: 200,
      child: StreamBuilder<List<PipeAccessoryUsageDto>>(
          stream: bloc.gearUsage,
          initialData: null,
          builder: (context, snapshot) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: PageView(
                controller: controller,
                children: <Widget>[
                  GearUsageItem(
                    label: "Tobacco",
                    gears: getUsageByType(snapshot.data, "Tobacco"),
                  ),
                  GearUsageItem(
                      label: "Hookah",
                      gears: getUsageByType(snapshot.data, "Hookah")),
                  GearUsageItem(
                      label: "Bowl",
                      gears: getUsageByType(snapshot.data, "Bowl")),
                ],
              ),
            );
          }),
    );
  }

  List<PipeAccessoryUsageDto> getUsageByType(
      List<PipeAccessoryUsageDto> usage, String type) {
    if (usage == null) {
      return null;
    }

    return Collection(usage)
        .where((f) => f.type == type)
        .orderByDescending((o) => o.used)
        .toList();
  }

  Widget buildStatRecap(StatisticBloc bloc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: StreamBuilder<StatisticRecap>(
        stream: bloc.recap,
        initialData: null,
        builder:
            (BuildContext context, AsyncSnapshot<StatisticRecap> snapshot) {
          return Container(
              child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: new StatisticRecapWidget(
                    label: "puffs",
                    ballColor: AppColors.colors[1],
                    value: snapshot?.data?.pufCount?.toString(),
                  ),
                ),
                Expanded(
                  child: new StatisticRecapWidget(
                    label: "smoking",
                    ballColor: AppColors.colors[0],
                    duration: snapshot?.data?.smokingTime,
                  ),
                ),
                Expanded(
                  child: new StatisticRecapWidget(
                    label: "activity",
                    ballColor: AppColors.colors[2],
                    duration: snapshot?.data?.activity,
                  ),
                ),
              ],
            ),
          ));
        },
      ),
    );
  }

  String getShortTime(Duration duration) {
    if (duration == null) {
      return null;
    }

    if (duration.inHours > 0) {
      return "${duration.inHours}hrs ${duration.inHours ~/ 24}m";
    }

    return duration.toString();
  }

  Positioned buildPositioned(
      StatisticBloc bloc, int color, double funct(StatisticItem s)) {
    return Positioned(
      top: 40,
      child: StreamBuilder<List<StatisticItem>>(
          stream: bloc.topGraphData,
          builder: (context, snapshot) {
            return Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: snapshot.data == null || snapshot.data.length == 0
                  ? Container()
                  : Sparkline(
                      cubicSmoothingFactor: 0.3,
                      useCubicSmoothing: true,
                      sharpCorners: false,
                      data: snapshot.data.map((f) => funct(f)).toList(),
                      lineColor: AppColors.colors[color],
                      fillMode: FillMode.below,
                      fillColor: AppColors.colors[color].withAlpha(60),
                      pointsMode: PointsMode.none,
                      pointSize: 5.0,
                      pointColor: Colors.amber,
                    ),
            );
          }),
    );
  }

  Widget buildDayStatistic(StatisticBloc bloc) {
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
                child: Column(
                  children: <Widget>[
                    Text(
                      'Week days',
                      style: Theme.of(context).textTheme.display2,
                    ),
                    Expanded(
                      child: new charts.BarChart(
                        _createSampleData(seriesList, (f, i) {
                          var day = getShortDayName(int.parse(f) + 1, context);
                          return new ChartData(day, i);
                        }),
                        animate: true,
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget buildTimeStatistic(StatisticBloc bloc) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        child: StreamBuilder<PersonStatisticsOverallDto>(
            stream: bloc.statistic,
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Container();
              }

              var seriesList =
                  snapshot.data.timeStatistics.sessionStartTimeDistribution;
              return Container(
                height: 250,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Start time',
                      style: Theme.of(context).textTheme.display2,
                    ),
                    Expanded(
                      child: new charts.BarChart(
                        _createSampleData(seriesList, (f, i) {
                          return new ChartData(f, i, order: int.parse(f));
                        }),
                        animate: true,
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }

  static List<charts.Series<ChartData, String>> _createSampleData(
      Map<String, int> imput, Function funct) {
    var convertedData = new List<ChartData>();
    imput.forEach((f, i) {
      convertedData.add(funct(f, i));
    });

    var ordered = new Collection(convertedData)
        .orderBy((keySelector) => keySelector.order);

    return [
      new charts.Series<ChartData, String>(
          id: 'Sales',
          colorFn: (data, __) {
            if (data.sales > 4) {
              return charts.MaterialPalette.red.shadeDefault;
            }
            return charts.MaterialPalette.green.shadeDefault;
          },
          domainFn: (ChartData sales, _) => sales.label,
          measureFn: (ChartData sales, _) => sales.sales,
          data: ordered.toList())
    ];
  }
}

class ChartData {
  final String label;
  final int order;
  final int sales;

  ChartData(this.label, this.sales, {this.order = 0});
}

class TimeSelect extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const TimeSelect({
    Key key,
    this.label,
    this.selected: false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (selected)
      return RoundedButton(
          borderWidth: 1,
          bottomMargin: 1,
          buttonColor: Colors.white,
          child: Text(label,
              style: Theme.of(context)
                  .textTheme
                  .display3
                  .apply(color: Colors.black)),
          height: 40,
          width: 30,
          onTap: () {});

    return RoundedButton(
      borderWidth: 1,
      bottomMargin: 1,
      buttonColor: Colors.black,
      child: Text(
        label,
        style: Theme.of(context).textTheme.display3,
      ),
      height: 40,
      width: 30,
      onTap: onTap,
    );
  }
}

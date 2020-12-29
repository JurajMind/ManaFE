import 'dart:async';

import 'package:app/Helpers/date_utils.dart' as dateUtils;
import 'package:app/app/app.widget.dart';
import 'package:app/components/Buttons/roundedButton.dart';
import 'package:app/components/SmokeSession/session_list.dart';
import 'package:app/components/Statistic/recap.dart';
import 'package:app/const/theme.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/person/statistic_bloc.dart';
import 'package:app/pages/Places/test_search.dart';
import 'package:app/pages/Statistic/UserProfile/user_profile_page.dart';
import 'package:app/pages/Statistic/all_statistic_page.dart';
import 'package:app/pages/Statistic/test_page.dart';
import 'package:app/services/authorization.dart';
import 'package:app/support/mana_icons_icons.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:app/components/Charts/sparkline.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openapi/api.dart';
import 'dart:math' as math;
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:shimmer/shimmer.dart';

import 'Components/gear_usage_stat.dart';
import 'Components/session_time_graph.dart';
import 'Components/week_day_graph.dart';
import 'Health/health_page.dart';
import 'Setting/setting.page.dart';

class StatisticPage extends StatefulWidget {
  @override
  State<StatisticPage> createState() => new _StatisticPageState();
}

class TimeModel {
  TimeModel({this.label, this.from, this.to});

  TimeModel.fromCustom(DateTime from, DateTime to) {
    label = " ${dateUtils.DateUtils.toStringDate(from)} - ${dateUtils.DateUtils.toStringDate(to)}";
    this.from = from;
    this.to = to;
  }

  TimeModel.fromSelect(int index) {
    var now = new DateTime.now();

    switch (index) {
      case 1:
        {
          from = now.subtract(new Duration(days: 30));
          to = now;
          label = '${dateUtils.DateUtils.toStringDate(from)} - ${dateUtils.DateUtils.toStringDate(to)}';
          break;
        }

      case 2:
        {
          from = now.subtract(new Duration(days: 7));
          to = now;
          label = '${dateUtils.DateUtils.toStringDate(from)} - ${dateUtils.DateUtils.toStringDate(to)}';
          break;
        }

      case 3:
        {
          from = now.subtract(new Duration(days: 2000));
          to = now;
          label = 'From begining';
          break;
        }

      case 0:
        {
          from = new DateTime(now.year, 1, 1);
          to = now;
          label = 'Year ${now.year}';
          break;
        }
    }
  }

  String label;

  DateTime from;

  DateTime to;
}

class _StatisticPageState extends State<StatisticPage> {
  math.Random random = new math.Random();
  PageController controller;
  Authorize auth = new Authorize();
  TimeModel selectedTime;
  StreamController<LineTouchResponse> touchController;
  bool loading = false;

  Future<int> _showDialog(BuildContext context) {
    return showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return Material(
            color: Color.fromARGB(150, 0, 0, 0),
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Center(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      durationSelector(context, 0, 'last Year'),
                      durationSelector(context, 1, 'last 30 days'),
                      durationSelector(context, 2, 'last 7 days'),
                      durationSelector(context, 3, 'Whole time'),
                      durationSelector(context, 4, 'Custom'),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  InkWell durationSelector(BuildContext context, int index, String label) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop(index);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Text(label.toUpperCase(), textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline6),
      ),
    );
  }

  @override
  initState() {
    super.initState();
    touchController = StreamController();
    touchController.stream.distinct().listen((LineTouchResponse response) {
      print('response: ${response.touchInput}');
    });
    selectedTime = new TimeModel.fromSelect(1);
    controller = new PageController(initialPage: 0, keepPage: true, viewportFraction: 0.9);
  }

  @override
  void dispose() {
    controller.dispose();
    touchController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = DataProvider.getData(context).statisticBloc;
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useTabletLayout = shortestSide > 600;
    return new Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 1200),
          child: CustomScrollView(
            physics: ClampingScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                actions: <Widget>[
                  new PopupMenuButton(
                    onSelected: (String value) {
                      switch (value) {
                        case 'settings':
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingPage()));
                          break;
                        case 'signOut':
                          auth.signOut();
                          AppWidget.restartApp(context);
                          break;
                        case 'test':
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserProfilePage()));
                          break;
                        case 'testPage':
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => TestPage()));
                          break;
                        case 'testPlaces':
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => TestSearch()));
                          break;
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        value: "settings",
                        child: Row(
                          children: <Widget>[
                            const Icon(Icons.settings),
                            const SizedBox(
                              width: 4,
                            ),
                            Text('Settings', style: Theme.of(context).textTheme.bodyText2),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: "test",
                        child: Row(
                          children: <Widget>[
                            const Icon(Icons.person),
                            const SizedBox(
                              width: 4,
                            ),
                            Text('User profile', style: Theme.of(context).textTheme.bodyText2),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: "testPage",
                        child: Row(
                          children: <Widget>[
                            const Icon(Icons.category),
                            const SizedBox(
                              width: 4,
                            ),
                            Text('Test page', style: Theme.of(context).textTheme.bodyText2),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: "signOut",
                        child: Row(
                          children: <Widget>[
                            const Icon(FontAwesomeIcons.signOutAlt),
                            const SizedBox(
                              width: 4,
                            ),
                            Text('Sign out', style: Theme.of(context).textTheme.bodyText2),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
                pinned: true,
                expandedHeight: 300.0,
                automaticallyImplyLeading: true,
                primary: true,
                flexibleSpace: new FlexibleSpaceBar(
                  background: Container(
                    color: Theme.of(context).backgroundColor,
                    child: Stack(
                      children: <Widget>[
                        buildPositioned(bloc, 1, (f) => f.pufCount.toDouble()),
                        buildPositioned(bloc, 0, (f) => f.smokeSessions.toDouble()),
                        buildPositioned(bloc, 2, (f) => f.activity.toDouble()),
                      ],
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size(700, 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                          flex: 4,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 300),
                              child: OutlineButton(
                                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                borderSide: BorderSide(color: Colors.white, width: 1),
                                onPressed: () => _showDialog(context).then((value) async {
                                  if (value == null) {
                                    return;
                                  }
                                  if (value == 4) {
                                    final List<DateTime> picked = await DateRagePicker.showDatePicker(
                                        context: context,
                                        initialFirstDate: selectedTime.from,
                                        initialLastDate: selectedTime.to,
                                        firstDate: new DateTime(2017),
                                        lastDate: new DateTime.now());
                                    if (picked != null && picked.length == 2) {
                                      print(picked);

                                      setState(() {
                                        selectedTime = new TimeModel.fromCustom(picked[0], picked[1]);
                                      });
                                      loadTime(bloc, selectedTime);
                                    }
                                  }
                                  setState(() {
                                    if (value >= 0 && value < 4) {
                                      selectedTime = new TimeModel.fromSelect(value);
                                    }
                                  });
                                  loadTime(bloc, selectedTime);
                                }),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Icon(Icons.calendar_today),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                          child: AutoSizeText(
                                        selectedTime.label,
                                        maxLines: 1,
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
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
                                                style: Theme.of(context).textTheme.headline4,
                                              ),
                                            )
                                          : Text(
                                              snapshot.data.sessionCount.toString(),
                                              style: Theme.of(context).textTheme.headline4,
                                            );
                                    }),
                                const SizedBox(
                                  width: 4,
                                ),
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
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    this.loading ? CircularProgressIndicator() : Container()
                  ],
                )),
              ),
              new SliverList(
                delegate: SliverChildListDelegate([
                  buildStatRecap(bloc),
                  new HealthWidget(bloc: bloc, time: this.selectedTime),
                  new GearUsageStat(controller: controller),
                  if (useTabletLayout) ...{
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Container(
                              height: 250,
                              child: SessionDayStream(bloc: bloc),
                            )),
                        Expanded(
                            flex: 1,
                            child: Container(
                              height: 250,
                              child: new WeekDayGraphStream(bloc: bloc),
                            )),
                      ],
                    )
                  } else ...{
                    new SessionDayStream(bloc: bloc),
                    new WeekDayGraphStream(bloc: bloc),
                  },
                  SizedBox(height: 10),
                  new SmokeSessionStat(bloc: bloc),
                  SizedBox(
                    height: 70,
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  loadTime(StatisticBloc bloc, TimeModel time) {
    setState(() {
      this.loading = true;
    });
    bloc.loadStatistic(time.from, time.to).then((_) {
      setState(() {
        this.loading = false;
      });
    });
  }

  Widget buildStatRecap(StatisticBloc bloc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: StreamBuilder<StatisticRecap>(
        stream: bloc.recap,
        initialData: null,
        builder: (BuildContext context, AsyncSnapshot<StatisticRecap> snapshot) {
          return Container(
              child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: new StatisticRecapWidget(
                    label: AppTranslations.of(context).text("profile.puffs"),
                    ballColor: AppColors.colors[1],
                    value: snapshot?.data?.pufCount?.toString(),
                  ),
                ),
                Expanded(
                  child: new StatisticRecapWidget(
                    label: AppTranslations.of(context).text("profile.smoking"),
                    ballColor: AppColors.colors[0],
                    duration: snapshot?.data?.smokingTime,
                  ),
                ),
                Expanded(
                  child: new StatisticRecapWidget(
                    label: AppTranslations.of(context).text("profile.activity"),
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

  Positioned buildPositioned(StatisticBloc bloc, int color, double funct(StatisticItem s)) {
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
                      lineWidth: 3,
                    ),
            );
          }),
    );
  }
}

class HealthWidget extends StatelessWidget {
  final TimeModel time;
  const HealthWidget({
    Key key,
    @required this.bloc,
    this.time,
  }) : super(key: key);

  final StatisticBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(16.0)),
        child: StreamBuilder<StatisticRecap>(
            stream: bloc.recap,
            builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {
                    return HealthPage(
                      from: this.time.from,
                      to: this.time.to,
                    );
                  })),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: new HealthIcon(snapshot.data?.sessionCount),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: <Widget>[
                            Text(AppTranslations.of(context).text('health.title'), style: Theme.of(context).textTheme.headline5),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.chevron_right,
                          size: 40,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class SmokeSessionStat extends StatelessWidget {
  const SmokeSessionStat({
    Key key,
    @required this.bloc,
  }) : super(key: key);

  final StatisticBloc bloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SmokeSessionSimpleDto>>(
        stream: bloc.smokeSessions,
        initialData: null,
        builder: (BuildContext context, AsyncSnapshot<List<SmokeSessionSimpleDto>> snapshot) {
          return SessionList(
            sessions: snapshot.data,
            sessionCount: 5,
            onPressed: () async {
              Navigator.of(context).push(new MaterialPageRoute(builder: (context) => AllStatisticPage(seed: snapshot.data)));
            },
          );
        });
  }
}

class HealthIcon extends StatelessWidget {
  const HealthIcon(
    this.pufCount, {
    Key key,
  }) : super(key: key);

  final int pufCount;
  @override
  Widget build(BuildContext context) {
    if (pufCount == null) {
      return Icon(
        FontAwesomeIcons.cog,
        size: 40,
        color: AppColors.colors[1],
      );
    }

    if (pufCount < 10) {
      return Icon(
        FontAwesomeIcons.smile,
        size: 40,
        color: AppColors.colors[1],
      );
    }

    if (pufCount < 30) {
      return Icon(
        FontAwesomeIcons.frown,
        size: 40,
        color: AppColors.colors[3],
      );
    }

    return Icon(
      FontAwesomeIcons.sadCry,
      size: 40,
      color: AppColors.colors[2],
    );
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
          child: Text(label, style: Theme.of(context).textTheme.bodyText2.apply(color: Colors.black)),
          height: 40,
          width: 30,
          onTap: () {});

    return RoundedButton(
      borderWidth: 1,
      bottomMargin: 1,
      buttonColor: Colors.black,
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      height: 40,
      width: 30,
      onTap: onTap,
    );
  }
}

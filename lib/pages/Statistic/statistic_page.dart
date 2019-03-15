import 'package:app/components/Buttons/roundedButton.dart';
import 'package:app/components/SmokeSession/smoke_session_list_item.dart';
import 'package:app/components/Statistic/recap.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/person/statistic_bloc.dart';
import 'package:app/pages/Settings/language_selector_page.dart';
import 'package:app/pages/Statistic/test_page.dart';
import 'package:app/services/authorization.dart';
import 'package:app/support/mana_icons_icons.dart';
import 'package:app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:app/components/Charts/sparkline.dart';
import 'package:openapi/api.dart';
import 'dart:math' as math;

import 'package:shimmer/shimmer.dart';

class StatisticPage extends StatefulWidget {
  @override
  State<StatisticPage> createState() => new _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  math.Random random = new math.Random();
  PageController controller;
  Authorize auth = new Authorize();
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
                      break;
                    case 'test':
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => StatisticPage()));
                      break;
                    case 'testPage':
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => TestPage()));
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
                  buildPositioned(bloc, 0, (f) => f.pufCount.toDouble()),
                  buildPositioned(bloc, 1, (f) => f.smokeSessions.toDouble()),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size(700, 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(flex: 1, child: new TimeSelect(label: 'Week')),
                  Expanded(flex: 1, child: new TimeSelect(label: 'Month')),
                  Expanded(
                      flex: 1,
                      child: new TimeSelect(
                        label: 'Year',
                        selected: true,
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
                child: Text(
              'STATS',
              style: Theme.of(context).textTheme.title,
            )),
          ),
          new SliverList(
            delegate: SliverChildListDelegate(buildBody(bloc)),
          )
        ],
      ),
    );
  }

  List<Widget> buildBody(StatisticBloc bloc) {
    var result = new List<Widget>();
    result.add(buildStatRecap(bloc));
    result.add(buildGearUsage(bloc));
    result.addAll(buildSmokeSession(bloc));
    result.add(SizedBox(
      height: 55,
    ));
    return result;
  }

  List<Widget> buildSmokeSession(StatisticBloc bloc) {
    var result = new List<Widget>();
    result.add(Center(
      child: new Text(
        'Smoke sessions',
        style: Theme.of(context).textTheme.title,
      ),
    ));
    result.add(StreamBuilder<List<SmokeSessionSimpleDto>>(
        stream: bloc.smokeSessions,
        initialData: null,
        builder: (BuildContext context,
            AsyncSnapshot<List<SmokeSessionSimpleDto>> snapshot) {
          return snapshot.data == null
              ? Placeholder()
              : Column(
                  children: snapshot.data.map((f) {
                  return SmokeSessionListItem(session: f);
                }).toList());
        }));
    return result;
  }

  Widget buildGearUsage(StatisticBloc bloc) {
    return Container(
      height: 400,
      width: 200,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: PageView.builder(
          controller: controller,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Placeholder();
          },
        ),
      ),
    );
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
                    ballColor: AppColors.colors[0],
                    value: snapshot?.data?.pufCount?.toString(),
                  ),
                ),
                Expanded(
                  child: new StatisticRecapWidget(
                    label: "smoking",
                    ballColor: AppColors.colors[1],
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
      child: StreamBuilder<List<StatisticItem>>(
          stream: bloc.topGraphData,
          builder: (context, snapshot) {
            return snapshot.data == null
                ? Container()
                : Sparkline(
                    cubicSmoothingFactor: 0.3,
                    useCubicSmoothing: true,
                    sharpCorners: false,
                    data: snapshot.data.map((f) => funct(f)).toList(),
                    lineColor: AppColors.colors[color],
                    fillMode: FillMode.below,
                    fillColor: AppColors.colors[color],
                    pointsMode: PointsMode.none,
                    pointSize: 5.0,
                    pointColor: Colors.amber,
                  );
          }),
    );
  }
}

class TimeSelect extends StatelessWidget {
  final String label;
  final bool selected;

  const TimeSelect({
    Key key,
    this.label,
    this.selected: false,
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
        onTap: () {},
      );

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
      onTap: () {},
    );
  }
}

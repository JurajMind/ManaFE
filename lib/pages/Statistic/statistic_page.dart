import 'package:app/module/data_provider.dart';
import 'package:app/module/person/statistic_bloc.dart';
import 'package:app/support/mana_icons_icons.dart';
import 'package:app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:app/components/Charts/sparkline.dart';
import 'dart:math' as math;

import 'package:shimmer/shimmer.dart';

class StatisticPage extends StatefulWidget {
  @override
  State<StatisticPage> createState() => new _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  math.Random random = new math.Random();

  @override
  Widget build(BuildContext context) {
    var bloc = DataProvider.getData(context).statisticBloc;
    return new Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
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
              preferredSize: Size(70, 40),
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Chip(
                        label: Text('Week'),
                      )),
                  Expanded(
                      flex: 1,
                      child: Chip(
                        label: Text('Month'),
                      )),
                  Expanded(
                      flex: 1,
                      child: Chip(
                        label: Text('Year'),
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
            delegate: SliverChildListDelegate(<Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[],
                        )
                      ],
                    )
                  ],
                ),
              ),
              buildStatRecap(bloc),
              Placeholder()
            ]),
          )
        ],
      ),
    );
  }

  Widget buildStatRecap(StatisticBloc bloc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: StreamBuilder<StatisticRecap>(
        stream: bloc.recap,
        initialData: null,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                    value: getShortTime(snapshot?.data?.smokingTime),
                  ),
                ),
                Expanded(
                  child: new StatisticRecapWidget(
                    label: "activity",
                    ballColor: AppColors.colors[2],
                    value: getShortTime(snapshot?.data?.activity),
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

class StatisticRecapWidget extends StatelessWidget {
  final Color ballColor;
  final String label;
  final String value;
  const StatisticRecapWidget({
    Key key,
    this.ballColor,
    this.label,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        direction: Axis.vertical,
        children: <Widget>[
          Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 15,
                  width: 15,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: ballColor),
                ),
                Text(' ${label?.toUpperCase()}',
                    style: Theme.of(context).textTheme.display2)
              ]),
          value != null
              ? Text(' $value', style: Theme.of(context).textTheme.display1)
              : Shimmer.fromColors(
                  baseColor: Colors.grey[400],
                  highlightColor: Colors.white,
                  child: Text(' Loading',
                      style: Theme.of(context).textTheme.display1),
                )
        ],
      ),
    );
  }
}

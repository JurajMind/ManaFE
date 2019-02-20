import 'package:app/module/data_provider.dart';
import 'package:app/module/person/statistic_bloc.dart';
import 'package:app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:app/components/Charts/sparkline.dart';
import 'dart:math' as math;

class StatisticPage extends StatefulWidget {
  @override
  State<StatisticPage> createState() => new _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  math.Random random = new math.Random();

  List<double> _generateRandomData(int count) {
    List<double> result = <double>[];
    for (int i = 0; i < count; i++) {
      result.add(random.nextDouble() * 20);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var bloc = DataProvider.getData(context).statisticBloc;
    var data = _generateRandomData(5);
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
                  buildPositioned(bloc,0,(f) => f.pufCount.toDouble()),    
                        buildPositioned(bloc,1,(f) => f.smokeSessions.toDouble()),                
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
                    child: Icon(Icons.title),
                  )
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
              Placeholder(),
              Placeholder()
            ]),
          )
        ],
      ),
    );
  }

  Positioned buildPositioned(StatisticBloc bloc,int color, double funct(StatisticItem s)){
    return Positioned(
                  child: StreamBuilder<List<StatisticItem>>(
                    stream: bloc.topGraphData,
                    builder: (context, snapshot) {
                      return snapshot.data == null? Container(): Sparkline(
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
                    }
                  ),
                );
  }
}

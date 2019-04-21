import 'dart:async';

import 'package:app/Helpers/date_utils.dart';
import 'package:app/const/theme.dart';
import 'package:app/models/SmokeSession/smoke_session_data.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/pages/SmokeSession/puff_timer.dart';
import 'package:app/pages/SmokeSession/smoke_session_page.dart';
import 'package:flutter/material.dart';
import 'package:queries/collections.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class SmokeTimerPage extends StatefulWidget {
  @override
  _SmokeTimerPageState createState() => new _SmokeTimerPageState();
}

class _SmokeTimerPageState extends State<SmokeTimerPage> {
  double height = 10;
  static const double maxHeight = 600;
  PufTimerDependencies dependencies;
  DataProvider dataProvider;
  StopWatches stopWatches;
  Duration animationDuration;
  StreamSubscription<int> subscription;
  List<double> charts;
  @override
  void initState() {
    stopWatches = new StopWatches(new Stopwatch(), new Stopwatch());
    charts = new List<double>();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dataProvider = DataProvider.getData(context);
    dependencies = new PufTimerDependencies(
        stopWatches.pufStopwatch, this.dataProvider.smokeSessionBloc);
    dependencies.smokeSessionBloc = dataProvider.smokeSessionBloc;
    subscription =
        dataProvider.smokeSessionBloc.smokeStateBroadcast.listen((data) {
      if (data == 1) {
        setState(() {
          if (mounted) this.height = maxHeight;
        });
      }
      if (data == 0) {
        setState(() {
          if (mounted) this.height = 10;
        });
      }
    });

    dataProvider.smokeSessionBloc.smokeStatistic.listen((data) {
      charts.add(data.lastPuf);
      charts = Collection(charts)
          .orderByDescending((f) => f)
          .distinct()
          .take(5)
          .toList();
    });
  }

  @override
  dispose() {
    this.dependencies.dispose();
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smoke timer'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: StreamBuilder<SmokeStatisticDataModel>(
            stream: dataProvider.smokeSessionBloc.smokeStatistic,
            initialData: dataProvider.smokeSessionBloc.smokeStatistic.value,
            builder: (context, snapshot) {
              return Column(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(),
                            ),
                            Expanded(
                              flex: 1,
                              child: new PuffTimeText(
                                  dependencies: dependencies,
                                  completeTime: 'Test'),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 2,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: AnimatedContainer(
                          duration: snapshot.data.longestPuf == new Duration()
                              ? new Duration(seconds: 4)
                              : snapshot.data.longestPuf,
                          width: 200,
                          height: height,
                          child: WaveWidget(
                            config: CustomConfig(
                              gradients: [
                                [AppColors.colors[3], Color(0xEEF44336)],
                                [AppColors.colors[1], Color(0x77E57373)],
                                [AppColors.colors[2], Color(0x66FF9800)],
                                [AppColors.colors[0], Color(0x55FFEB3B)]
                              ],
                              durations: [35000, 19440, 10800, 6000],
                              heightPercentages: [0.20, 0.23, 0.25, 0.30],
                              blur: MaskFilter.blur(BlurStyle.solid, 10),
                              gradientBegin: Alignment.bottomLeft,
                              gradientEnd: Alignment.topRight,
                            ),
                            waveAmplitude: 0,
                            backgroundColor: Colors.transparent,
                            size: Size(double.infinity, double.infinity),
                          ),
                        )),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        Text(
                          "TOP: ${DateUtils.toSecondDuration(snapshot.data.longestPuf)}",
                          style: Theme.of(context).textTheme.display1,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: this.charts.length,
                            itemBuilder: (context, index) {
                              return Center(
                                  child: Text(
                                "${index + 1}. ${this.charts[index].toString()}.sec",
                                style: Theme.of(context).textTheme.body2,
                              ));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

import 'dart:async';

import 'package:app/Helpers/date_utils.dart' as dateUtils;
import 'package:app/app/app.dart';
import 'package:app/const/theme.dart';
import 'package:app/main.dart';
import 'package:app/models/SmokeSession/smoke_session_data.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/Components/puff_timer.dart';
import 'package:app/pages/SmokeSession/Components/stop_watches.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:darq/darq.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class SmokeTimerPage extends StatefulWidget {
  @override
  _SmokeTimerPageState createState() => new _SmokeTimerPageState();
}

class _SmokeTimerPageState extends State<SmokeTimerPage> {
  double height = 10;
  double lastPuf = 0;
  static const double maxHeight = 600;
  DataProvider? dataProvider;
  StopWatches? stopWatches;
  Duration? animationDuration;
  late StreamSubscription<int?> subscription;
  late List<double> charts;
  @override
  void initState() {
    stopWatches = new StopWatches(new Stopwatch(), new Stopwatch());
    charts = <double>[];
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dataProvider = DataProvider.getData(context);

    subscription = getIt.get<SmokeSessionBloc>().smokeStateBroadcast.listen((data) {
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

    getIt.get<SmokeSessionBloc>().smokeStatistic.listen((data) {
      if (data!.lastPuf > 2) {
        lastPuf = data.lastPuf;
      }

      charts.add(data.lastPuf);
      charts = List.from(charts).orderByDescending((f) => f).distinct().take(5).toList() as List<double>;
    });
  }

  @override
  dispose() {
    subscription.cancel();
    super.dispose();
  }

  TextEditingController _textFieldController = TextEditingController();
  _displayDialog(BuildContext context) async {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(lastPuf.toStringAsFixed(3)),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Name"),
            ),
            actions: <Widget>[
              new TextButton(
                child: new Text('CANCEL'),
                textColor: Colors.red,
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              new TextButton(
                child: new Text(AppTranslations.of(context)!.text("common.save").toUpperCase()),
                textColor: Colors.green,
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              )
            ],
          );
        }).then((result) {
      if (!result!) return;
      App.http!.addCompetitionEntry(_textFieldController.text, lastPuf).then((onValue) {
        HapticFeedback.selectionClick();
        setState(() {
          _textFieldController.text = '';
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SMOKE TIMER'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: StreamBuilder<SmokeStatisticDataModel?>(
            stream: getIt.get<SmokeSessionBloc>().smokeStatistic,
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
                              child: new PuffTimeText(completeTime: 'Test'),
                            ),
                            Expanded(
                              flex: 1,
                              child: IconButton(icon: Icon(Icons.add), onPressed: () => _displayDialog(context)),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 2,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: AnimatedContainer(
                          duration: snapshot.data!.longestPuf == new Duration()
                              ? new Duration(seconds: 4)
                              : snapshot.data!.longestPuf,
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
                          "TOP: ${dateUtils.DateUtils.toSecondDuration(snapshot.data!.longestPuf)}",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: this.charts.length,
                            itemBuilder: (context, index) {
                              return Center(
                                  child: Text(
                                "${index + 1}. ${this.charts[index].toString()}.sec",
                                style: Theme.of(context).textTheme.headline4,
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

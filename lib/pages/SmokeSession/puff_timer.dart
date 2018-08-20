import 'dart:async';

import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/src/observable.dart';

class PuffTimeText extends StatefulWidget {
  PuffTimeText({this.dependencies, this.completeTime});
  final Dependencies dependencies;
  final String completeTime;
  @override
  State<StatefulWidget> createState() {
    return new PuffTimeState();
  }
}

class PuffTimeState extends State<PuffTimeText> {
  Timer timer;
  int milliseconds;
  String alternativeText = '0.00';
  bool showTimer = false;

  Observable<int> stream;

  StreamSubscription<int> subscription;

  void initState() {
    timer = new Timer.periodic(
        new Duration(
            milliseconds: widget.dependencies.timerMillisecondsRefreshRate),
        callback);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    subscription =
        widget.dependencies.smokeSessionBloc.smokeStateBroadcast.listen((data) {
      if (data != 0) {
        widget.dependencies.stopwatch.reset();
        widget.dependencies.stopwatch.start();
        setState(() {
          showTimer = true;
        });
      }
      if (data == 0) {
        widget.dependencies.stopwatch.stop();
        setState(() {
          showTimer = false;
        });
      }
    });

    widget.dependencies.smokeSessionBloc.smokeStatistic
        .listen((data) => alternativeText = data.lastPuf.toString());
    super.didChangeDependencies();
  }

  void callback(Timer timer) {
    if (milliseconds != widget.dependencies.stopwatch.elapsedMilliseconds) {
      milliseconds = widget.dependencies.stopwatch.elapsedMilliseconds;
      final int hundreds = (milliseconds / 10).truncate();
      final int seconds = (hundreds / 100).truncate();
      final int minutes = (seconds / 60).truncate();
      final ElapsedTime elapsedTime = new ElapsedTime(
        hundreds: hundreds,
        seconds: seconds,
        minutes: minutes,
      );
      for (final listener in widget.dependencies.timerListeners) {
        listener(elapsedTime);
      }
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;

    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Offstage(
          offstage: !this.showTimer,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new RepaintBoundary(
                child: new SizedBox(
                  height: 30.0,
                  child:
                      new MinutesAndSeconds(dependencies: widget.dependencies),
                ),
              ),
              new RepaintBoundary(
                child: new SizedBox(
                  height: 30.0,
                  child: new Hundreds(dependencies: widget.dependencies),
                ),
              ),
            ],
          ),
        ),
        Offstage(
            offstage: this.showTimer,
            child: Text(this.alternativeText,
                style: widget.dependencies.textStyle))
      ],
    );
  }
}

class Dependencies {
  Dependencies({this.stopwatch});

  final List<ValueChanged<ElapsedTime>> timerListeners =
      <ValueChanged<ElapsedTime>>[];

  final TextStyle textStyle =
      const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);
  final Stopwatch stopwatch;
  SmokeSessionBloc smokeSessionBloc;
  final int timerMillisecondsRefreshRate = 30;
}

class ElapsedTime {
  final int hundreds;
  final int seconds;
  final int minutes;

  ElapsedTime({
    this.hundreds,
    this.seconds,
    this.minutes,
  });
}

class Hundreds extends StatefulWidget {
  Hundreds({this.dependencies});
  final Dependencies dependencies;

  HundredsState createState() => new HundredsState(dependencies: dependencies);
}

class HundredsState extends State<Hundreds> {
  HundredsState({this.dependencies});
  final Dependencies dependencies;

  int hundreds = 0;

  @override
  void initState() {
    dependencies.timerListeners.add(onTick);
    super.initState();
  }

  void onTick(ElapsedTime elapsed) {
    if (elapsed.hundreds != hundreds) {
      setState(() {
        hundreds = elapsed.hundreds;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');
    return new Text(hundredsStr, style: dependencies.textStyle);
  }
}

class MinutesAndSeconds extends StatefulWidget {
  MinutesAndSeconds({this.dependencies});
  final Dependencies dependencies;

  MinutesAndSecondsState createState() =>
      new MinutesAndSecondsState(dependencies: dependencies);
}

class MinutesAndSecondsState extends State<MinutesAndSeconds> {
  MinutesAndSecondsState({this.dependencies});
  final Dependencies dependencies;

  int seconds = 0;

  @override
  void initState() {
    dependencies.timerListeners.add(onTick);
    super.initState();
  }

  void onTick(ElapsedTime elapsed) {
    if (elapsed.seconds != seconds) {
      setState(() {
        seconds = elapsed.seconds;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String secondsStr = (seconds).toString().padLeft(1, '0');
    return new Text('$secondsStr.', style: dependencies.textStyle);
  }
}

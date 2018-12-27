import 'dart:async';

import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:flutter/material.dart';

class PuffTimeText extends StatelessWidget {
  PuffTimeText({this.dependencies, this.completeTime});
  final PufTimerDependencies dependencies;
  final String completeTime;
  @override
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Offstage(
          offstage: !this.dependencies.showTimer,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new RepaintBoundary(
                child: new SizedBox(
                  height: 30.0,
                  child: new MinutesAndSeconds(dependencies: this.dependencies),
                ),
              ),
              new RepaintBoundary(
                child: new SizedBox(
                  height: 30.0,
                  child: new Hundreds(dependencies: this.dependencies),
                ),
              ),
            ],
          ),
        ),
        Offstage(
            offstage: this.dependencies.showTimer,
            child: SizedBox(
              height: 30.0,
              child: Text(this.dependencies.alternativeText,
                  style: this.dependencies.textStyle),
            ))
      ],
    );
  }
}

class PufTimerDependencies {
  StreamSubscription<int> subscription;
  bool showTimer;
  Timer timer;
  String alternativeText;
  int milliseconds;

  PufTimerDependencies(stopwatch, smokeSessionBloc) {
    this.stopwatch = stopwatch;
    this.timer = new Timer.periodic(
        new Duration(milliseconds: this.timerMillisecondsRefreshRate),
        callback);

    subscription = smokeSessionBloc.smokeStateBroadcast.listen((data) {
      if (data != 0) {
        print('start timer');
        this.stopwatch.reset();
        this.stopwatch.start();

        showTimer = true;
      }
      if (data == 0) {
        this.stopwatch.stop();
        print('end timer');
        showTimer = false;
      }
    });

    smokeSessionBloc.smokeStatistic
        .listen((data) => alternativeText = data.lastPuf.toStringAsFixed(2));
  }

  dispose() {
    this.timer.cancel();
  }

  final List<ValueChanged<ElapsedTime>> timerListeners =
      <ValueChanged<ElapsedTime>>[];

  final TextStyle textStyle =
      const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);
  Stopwatch stopwatch;
  SmokeSessionBloc smokeSessionBloc;
  final int timerMillisecondsRefreshRate = 30;

  void callback(Timer timer) {
    if (milliseconds != this.stopwatch.elapsedMilliseconds) {
      milliseconds = this.stopwatch.elapsedMilliseconds;
      final int hundreds = (milliseconds / 10).truncate();
      final int seconds = (hundreds / 100).truncate();
      final int minutes = (seconds / 60).truncate();
      final ElapsedTime elapsedTime = new ElapsedTime(
        hundreds: hundreds,
        seconds: seconds,
        minutes: minutes,
      );
      for (final listener in this.timerListeners) {
        listener(elapsedTime);
      }
    }
  }
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
  final PufTimerDependencies dependencies;

  HundredsState createState() => new HundredsState(dependencies: dependencies);
}

class HundredsState extends State<Hundreds> {
  HundredsState({this.dependencies});
  final PufTimerDependencies dependencies;

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

  @override
  void dispose() {
    dependencies.timerListeners.remove(onTick);
    super.dispose();
  }
}

class MinutesAndSeconds extends StatefulWidget {
  MinutesAndSeconds({this.dependencies});
  final PufTimerDependencies dependencies;

  MinutesAndSecondsState createState() =>
      new MinutesAndSecondsState(dependencies: dependencies);
}

class MinutesAndSecondsState extends State<MinutesAndSeconds> {
  MinutesAndSecondsState({this.dependencies});
  final PufTimerDependencies dependencies;

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

  @override
  void dispose() {
    dependencies.timerListeners.remove(onTick);
    super.dispose();
  }
}

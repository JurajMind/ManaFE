import 'dart:async';

import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/Components/puff_timer.dart';
import 'package:flutter/material.dart';

class PufTimerDependencies {
  StreamSubscription<int> subscription;
  bool showTimer = false;
  Timer timer;
  String alternativeText = '';
  int milliseconds;
  Stopwatch stopwatch;

  PufTimerDependencies(SmokeSessionBloc smokeSessionBloc) {
    this.stopwatch = new Stopwatch();
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
    subscription.cancel();
  }

  final List<ValueChanged<ElapsedTime>> timerListeners =
      <ValueChanged<ElapsedTime>>[];

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

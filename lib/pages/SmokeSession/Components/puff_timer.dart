import 'package:app/main.dart';
import 'package:app/models/SmokeSession/timer_dependency.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:flutter/material.dart';

import '../../../app/app.dart';

class PuffTimeText extends StatelessWidget {
  PuffTimeText({this.completeTime});
  final String? completeTime;
  @override
  @override
  Widget build(BuildContext context) {
    var dependencies = getIt.get<SmokeSessionBloc>().pufTimerDependencies;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Offstage(
          offstage: !dependencies.showTimer,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new RepaintBoundary(
                child: new SizedBox(
                  height: 38.0,
                  child: new MinutesAndSeconds(dependencies: dependencies),
                ),
              ),
              new RepaintBoundary(
                child: new SizedBox(
                  height: 38.0,
                  child: new Hundreds(dependencies: dependencies),
                ),
              ),
            ],
          ),
        ),
        Offstage(
            offstage: dependencies.showTimer,
            child: SizedBox(
              height: 38.0,
              child: Text(dependencies.alternativeText,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: App.appType == AppType.freya ? Colors.white : Colors.grey)),
            ))
      ],
    );
  }
}

class ElapsedTime {
  final int? hundreds;
  final int? seconds;
  final int? minutes;

  ElapsedTime({
    this.hundreds,
    this.seconds,
    this.minutes,
  });
}

class Hundreds extends StatefulWidget {
  Hundreds({this.dependencies});
  final PufTimerDependencies? dependencies;

  HundredsState createState() => new HundredsState(dependencies: dependencies);
}

class HundredsState extends State<Hundreds> {
  HundredsState({this.dependencies});
  final PufTimerDependencies? dependencies;

  int? hundreds = 0;

  @override
  void initState() {
    dependencies!.timerListeners.add(onTick);
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
    String hundredsStr = (hundreds! % 100).toString().padLeft(2, '0');
    return new Text(hundredsStr, style: Theme.of(context).textTheme.headlineMedium);
  }

  @override
  void dispose() {
    dependencies!.timerListeners.remove(onTick);
    super.dispose();
  }
}

class MinutesAndSeconds extends StatefulWidget {
  MinutesAndSeconds({this.dependencies});
  final PufTimerDependencies? dependencies;

  MinutesAndSecondsState createState() => new MinutesAndSecondsState(dependencies: dependencies);
}

class MinutesAndSecondsState extends State<MinutesAndSeconds> {
  MinutesAndSecondsState({this.dependencies});
  final PufTimerDependencies? dependencies;

  int? seconds = 0;

  @override
  void initState() {
    dependencies!.timerListeners.add(onTick);
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
    return new Text('$secondsStr.', style: Theme.of(context).textTheme.headlineMedium);
  }

  @override
  void dispose() {
    dependencies!.timerListeners.remove(onTick);
    super.dispose();
  }
}

import 'dart:async';

import 'package:app/Helpers/date_utils.dart';
import 'package:flutter/material.dart';

class SinceTimer extends StatefulWidget {
  final DateTime start;

  const SinceTimer({Key key, this.start}) : super(key: key);
  @override
  _SinceTimerState createState() => new _SinceTimerState();
}

class _SinceTimerState extends State<SinceTimer> {
  Timer _timer;
  String text = "";

  @override
  void initState() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (timer) {
      var diference = DateTime.now().difference(widget.start ?? DateTime.now());
      var stringDurations = DateUtils.toStringDuration(diference);
      setState(() {
        text = stringDurations;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Text(text);
  }

  @override
  dispose() {
    _timer.cancel();
    super.dispose();
  }
}

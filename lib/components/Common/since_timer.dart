import 'dart:async';

import 'package:app/Helpers/date_utils.dart' as dayHelper;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SinceTimer extends StatefulWidget {
  final DateTime? start;
  final int? pufCount;
  final TextStyle? style;

  const SinceTimer({Key? key, this.start, this.pufCount, this.style}) : super(key: key);
  @override
  _SinceTimerState createState() => new _SinceTimerState();
}

class _SinceTimerState extends State<SinceTimer> {
  late Timer _timer;
  String text = "";

  @override
  void initState() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (timer) {
      var diference = DateTime.now().difference(widget.start ?? DateTime.now());
      var stringDurations = dayHelper.DateUtils.toStringDuration(diference);
      setState(() {
        text = stringDurations;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.pufCount == 0) {
      return new AutoSizeText('0:0:0', style: widget.style);
    }

    return new Text(text, style: widget.style);
  }

  @override
  dispose() {
    _timer.cancel();
    super.dispose();
  }
}

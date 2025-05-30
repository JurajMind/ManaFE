import 'dart:async';

import 'package:app/components/Common/bg_painter.dart';
import 'package:app/main.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:flutter/material.dart';

class ColorSessionGimick extends StatefulWidget {
  const ColorSessionGimick({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  _ColorSessionGimickState createState() => _ColorSessionGimickState();
}

class _ColorSessionGimickState extends State<ColorSessionGimick>
    with SingleTickerProviderStateMixin {
  @override
  dispose() {
    _controller.dispose();
    subscription.cancel();
    super.dispose();
  }

  late AnimationController _controller;
  late StreamSubscription<int?> subscription;
  Animatable<Color?> background = TweenSequence<Color?>(
    [
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.red,
          end: Colors.green,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.green,
          end: Colors.blue,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.blue,
          end: Colors.pink,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.pink,
          end: Colors.blue,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.blue,
          end: Colors.green,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.green,
          end: Colors.red,
        ),
      ),
    ],
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 50),
      vsync: this,
    )..repeat();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var dataProvider = DataProvider.getData(context);

    subscription =
        getIt.get<SmokeSessionBloc>().smokeStateBroadcast.listen((data) {
      if (data == 1) {
        _controller.duration = Duration(seconds: 10);
        _controller.repeat();
      }
      if (data == 0) {
        _controller.duration = Duration(seconds: 50);
        _controller.repeat();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useTabletLayout = shortestSide > 600;
    if (useTabletLayout)
      return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: BgPainter(
                color: background
                    .evaluate(AlwaysStoppedAnimation(_controller.value)),
                logoSize: 1.0,
                startPoint: Offset(0, -50),
                hueRotation: -4,
              ),
            );
          });

    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: BgPainter(
              color: background
                  .evaluate(AlwaysStoppedAnimation(_controller.value)),
              logoSize: 0.45,
              startPoint: Offset(0, -50),
              hueRotation: -4,
            ),
          );
        });
  }
}

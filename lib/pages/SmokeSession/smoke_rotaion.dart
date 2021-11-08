import 'dart:async';

import 'package:app/main.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:flutter/material.dart';

class SmokeRotation extends StatefulWidget {
  final Widget child;
  final Widget innerChild;

  const SmokeRotation({Key key, this.child, this.innerChild}) : super(key: key);

  @override
  _SmokeRotationState createState() => new _SmokeRotationState();
}

class _SmokeRotationState extends State<SmokeRotation>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  SmokeSessionBloc smokeSessionBloc;

  StreamSubscription<int> subscription;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 7),
    );
  }

  @override
  void didChangeDependencies() {
    smokeSessionBloc = getIt.get<SmokeSessionBloc>();

    subscription = smokeSessionBloc.smokeStateBroadcast.listen((data) {
      if (data == 0) {
        animationController.reset();
      } else {
        animationController.forward();
      }
    });

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      child: AnimatedBuilder(
          animation: animationController,
          child: widget.child,
          builder: (BuildContext context, Widget _widget) {
            return new Transform.rotate(
              angle: animationController.value * 6.3,
              child: _widget,
            );
          }),
    );
  }
}

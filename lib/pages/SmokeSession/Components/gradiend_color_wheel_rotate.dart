import 'dart:ui';

import 'package:app/main.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/smoke_rotaion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientColorWheelRotate extends StatefulWidget {
  const GradientColorWheelRotate(
      {key, this.defaultColors, this.child, this.size, this.border})
      : super(key: key);
  @required
  final List<Color>? defaultColors;
  final Widget? child;
  final Size? size;
  final bool? border;
  @override
  GradientColorWheelRotateState createState() {
    return new GradientColorWheelRotateState();
  }
}

class GradientColorWheelRotateState extends State<GradientColorWheelRotate> {
  Offset? position;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final smokeSessionBloc = getIt.get<SmokeSessionBloc>();

    Size size = widget.size == null ? MediaQuery.of(context).size : widget.size!;

    return Stack(
      children: <Widget>[
        Container(
          child: SmokeRotation(
            child: RepaintBoundary(
                child: StreamBuilder<List<Color>>(
              stream: smokeSessionBloc.sessionColor,
              initialData: widget.defaultColors,
              builder: (context, snapshot) => Container(
                  height: size.height,
                  width: size.width,
                  child: Container(),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          stops: [0.4, 1.0],
                          tileMode: TileMode.clamp,
                          colors: snapshot.data != null
                              ? snapshot.data!
                              : widget.defaultColors!))),
            )),
          ),
        ),
        Positioned(
          child: Container(
              height: size.height,
              width: size.width,
              child: Center(
                  child: Container(
                      height: size.height - 20,
                      width: size.width - 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withAlpha(180)),
                      child: widget.child))),
        ),
      ],
    );
  }
}

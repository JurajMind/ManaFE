
import 'package:app/main.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientColorWheel extends StatefulWidget {
  const GradientColorWheel(
      {key, this.defaultColors, this.child, this.size, this.border})
      : super(key: key);
  @required
  final List<Color>? defaultColors;
  final Widget? child;
  final Size? size;
  final bool? border;
  @override
  GradientColorWheelState createState() {
    return new GradientColorWheelState();
  }
}

class GradientColorWheelState extends State<GradientColorWheel> {
  Offset? position;

  @override
  void initState() {
    super.initState();
  }

  StreamBuilder<List<Color>> buildCircle(
      SmokeSessionBloc smokeSessionBloc, Size? size) {
    return StreamBuilder<List<Color>>(
      stream: smokeSessionBloc.sessionColor,
      initialData: widget.defaultColors,
      builder: (context, snapshot) => Container(
          height: size!.height,
          width: size.width,
          child: widget.child,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  stops: [0.4, 1.0],
                  tileMode: TileMode.clamp,
                  colors: snapshot.data != null
                      ? snapshot.data!
                      : widget.defaultColors!))),
    );
  }

  @override
  Widget build(BuildContext context) {
    final smokeSessionBloc = getIt.get<SmokeSessionBloc>();

    Size? size = widget.size == null ? MediaQuery.of(context).size : widget.size;

    return Container(
      child: RepaintBoundary(child: buildCircle(smokeSessionBloc, size)),
    );
  }
}

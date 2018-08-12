import 'dart:async';

import 'package:app/models/Stand/animation.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/smoke_color_wheel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class AnimationsPicker extends StatefulWidget {
  final Stream<List<StandAnimation>> aminations;

  const AnimationsPicker({Key key, this.aminations}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _AnimationsPickerState();
  }
}

class _AnimationsPickerState extends State<AnimationsPicker> {
  PageController controller;
  static const _kDuration = const Duration(milliseconds: 300);

  SmokeSessionBloc smokeSessionBloc;

  @override
  void didChangeDependencies() {
    smokeSessionBloc = DataProvider.getSmokeSession(context);
    smokeSessionBloc.loadAnimation();
    super.didChangeDependencies();
  }

  static const _kCurve = Curves.ease;
  @override
  void initState() {
    controller = new PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.75 + size.width,
      child: Stack(
        children: <Widget>[
          PageView(
            controller: controller,
            children: <Widget>[
              AnimationStatePicker(smokeSessionBloc: smokeSessionBloc),
              AnimationStatePicker(smokeSessionBloc: smokeSessionBloc),
              AnimationStatePicker(smokeSessionBloc: smokeSessionBloc),
            ],
          ),
          AnimationStateLabel(
            controller: controller,
            labels: ['Blow', 'Idle', 'Smoke'],
            onPageSelected: (int page) {
              controller.animateToPage(
                page,
                duration: _kDuration,
                curve: _kCurve,
              );
            },
          )
        ],
      ),
    );
  }
}

class AnimationStatePicker extends StatefulWidget {
  final SmokeSessionBloc smokeSessionBloc;

  AnimationStatePicker({this.smokeSessionBloc});

  @override
  AnimationStatePickerState createState() {
    return new AnimationStatePickerState();
  }
}

class AnimationStatePickerState extends State<AnimationStatePicker> {
  StreamBuilder<List<StandAnimation>> buildAnimationList() {
    return StreamBuilder<List<StandAnimation>>(
        stream: widget.smokeSessionBloc.animations,
        initialData: List<StandAnimation>(),
        builder: (context, snapshot) => ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) =>
                  _createAnimation(index, snapshot.data[index], context),
            ));
  }

  Widget _createAnimation(
      int index, StandAnimation data, BuildContext context) {
    print(data.displayName);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Text(
            data.displayName,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.75 + size.width,
      child: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            children: <Widget>[
              SizedBox(
                  height: size.height * 0.75,
                  child: Container(
                    child: buildAnimationList(),
                  )),
              SizedBox(height: size.width, child: SmokeColorWheel()),
            ],
          )
        ],
      ),
    );
  }
}

class AnimationStateLabel extends AnimatedWidget {
  final PageController controller;
  final List<String> labels;
  final ValueChanged<int> onPageSelected;
  final Color color;

  AnimationStateLabel({
    this.controller,
    this.labels,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.black, Colors.transparent])),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: new List<Widget>.generate(labels.length, _buildDot),
      ),
    );
  }

  // The base size of the dots
  static const double _kDotSize = 20.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 1.1;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: new Center(
          child: new InkWell(
            onTap: () => onPageSelected(index),
            child: Text(
              labels[index],
              style: new TextStyle(
                  fontSize: 25.0 * zoom,
                  fontWeight: FontWeight.bold,
                  color: controller.page == index ? Colors.white : Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}

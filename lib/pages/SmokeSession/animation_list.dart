import 'dart:async';
import 'dart:math' as math;

import 'package:app/models/Stand/animation.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/smoke_color_wheel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimationMetrics extends FixedScrollMetrics {
  /// The fraction of the viewport that each page occupies.
  ///
  /// Used to compute [page] from the current [pixels].
  final double viewportFraction;

  AnimationMetrics({
    @required double minScrollExtent,
    @required double maxScrollExtent,
    @required double pixels,
    @required double viewportDimension,
    @required AxisDirection axisDirection,
    @required this.viewportFraction,
  }) : super(
          minScrollExtent: minScrollExtent,
          maxScrollExtent: maxScrollExtent,
          pixels: pixels,
          viewportDimension: viewportDimension,
          axisDirection: axisDirection,
        );

  /// The current page displayed in the [PageView].
  double get item {
    return math.max(0.0, pixels.clamp(minScrollExtent, maxScrollExtent)) /
        math.max(1.0, viewportDimension * viewportFraction);
  }

  @override
  AnimationMetrics copyWith({
    double minScrollExtent,
    double maxScrollExtent,
    double pixels,
    double viewportDimension,
    AxisDirection axisDirection,
    double viewportFraction,
  }) {
    return new AnimationMetrics(
      minScrollExtent: minScrollExtent ?? this.minScrollExtent,
      maxScrollExtent: maxScrollExtent ?? this.maxScrollExtent,
      pixels: pixels ?? this.pixels,
      viewportDimension: viewportDimension ?? this.viewportDimension,
      axisDirection: axisDirection ?? this.axisDirection,
      viewportFraction: viewportFraction ?? this.viewportFraction,
    );
  }
}

class AnimationsPicker extends StatefulWidget {
  final Stream<List<StandAnimation>> aminations;

  const AnimationsPicker({Key key, this.aminations}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _AnimationsPickerState();
  }
}

class AnimationStateLabel extends AnimatedWidget {
  static const double _kDotSize = 20.0;
  static const double _kMaxZoom = 1.1;
  static const double _kDotSpacing = 25.0;
  final PageController controller;

  final List<String> labels;
  final ValueChanged<int> onPageSelected;

  // The base size of the dots
  final Color color;

  // The increase in the size of the selected dot
  AnimationStateLabel({
    this.controller,
    this.labels,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  // The distance between the center of each dot
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

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      math.max(
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

class AnimationStatePicker extends StatefulWidget {
  final SmokeSessionBloc smokeSessionBloc;

  AnimationStatePicker({this.smokeSessionBloc});

  @override
  AnimationStatePickerState createState() {
    return new AnimationStatePickerState();
  }
}

class AnimationStatePickerState extends State<AnimationStatePicker> {
  ScrollController controller;

  int lastReportedItem = 0;
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.75 + size.width,
      child: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SizedBox(
              height: size.height * 0.75,
              child: Container(
                child: NotificationListener(
                    onNotification: (ScrollNotification notification) {
                      if (notification.depth == 0 &&
                          notification is ScrollUpdateNotification) {
                        final FixedScrollMetrics metrics = notification.metrics;
                        final double currentItem = getSelectedItem(metrics);
                      }
                      return false;
                    },
                    child: buildAnimationList()),
              ))
        ],
      ),
    );
  }

  StreamBuilder<List<StandAnimation>> buildAnimationList() {
    return StreamBuilder<List<StandAnimation>>(
        stream: widget.smokeSessionBloc.animations,
        initialData: List<StandAnimation>(),
        builder: (context, snapshot) => new ListWheelScrollView(
              itemExtent: 50.0,
              clipToSize: true,
              diameterRatio: 10.0,
              perspective: 0.01,
              onSelectedItemChanged: (int index) => setState(() {
                    selectedItem = index;
                  }),
              children: List.generate(
                  snapshot.data.length,
                  (int index) => _createAnimation(
                      index, snapshot.data[index], context, selectedItem)),
            ));
  }

  double getSelectedItem(FixedScrollMetrics metric) {
    return math.max(
            0.0,
            metric.pixels
                .clamp(metric.minScrollExtent, metric.maxScrollExtent)) /
        math.max(1.0, 30);
  }

  @override
  void initState() {
    controller = new ScrollController();
    super.initState();
  }

  _createAnimation(
      int index, StandAnimation data, BuildContext context, int selected) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Center(
          child: Text(data.displayName,
              style: TextStyle(
                color: index == selected ? Colors.white : Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: index == selected ? 35.0 : 25.0,
              )),
        ),
      ),
    );
  }
}

class _AnimationsPickerState extends State<AnimationsPicker> {
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  PageController controller;

  SmokeSessionBloc smokeSessionBloc;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.75,
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

  @override
  void didChangeDependencies() {
    smokeSessionBloc = DataProvider.getSmokeSession(context);
    smokeSessionBloc.loadAnimation();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    controller = new PageController();
    super.initState();
  }
}

import 'dart:async';
import 'dart:math' as math;

import 'package:app/models/SmokeSession/smoke_session.dart';
import 'package:app/models/Stand/animation.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/animation_state_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
              animationStatePickerBuilder(
                  smokeSessionBloc.standSettings, SmokeState.blow, 'PURGE'),
              animationStatePickerBuilder(
                  smokeSessionBloc.standSettings, SmokeState.idle, 'IDLE'),
              animationStatePickerBuilder(
                  smokeSessionBloc.standSettings, SmokeState.puf, 'SMOKING'),
            ],
          ),
        ],
      ),
    );
  }

  void changeAnimation() {}

  StreamBuilder<StandSettings> animationStatePickerBuilder(
      Stream<StandSettings> stream, SmokeState state, String label) {
    return StreamBuilder<StandSettings>(
      initialData: null,
      stream: stream,
      builder: (context, snapshot) => snapshot.data == null
          ? CircularProgressIndicator()
          : AnimationStatePicker(
              smokeSessionBloc: smokeSessionBloc,
              label: label,
              state: state,
              selectedIndex: snapshot.data.getStateSetting(state) == null
                  ? -1
                  : snapshot.data.getStateSetting(state).animationId,
              onChanged: (int index) {
                smokeSessionBloc.setAnimation(index, state);
              },
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

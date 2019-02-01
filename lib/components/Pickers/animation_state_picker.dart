import 'dart:async';
import 'package:app/models/SmokeSession/smoke_session.dart';
import 'package:app/models/Stand/animation.dart';
import 'package:app/models/Stand/deviceSetting.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/picker_slider.dart';
import 'package:flutter/material.dart';
import 'package:vibrate/vibrate.dart';

class AnimationStatePicker extends StatefulWidget {
  final SmokeSessionBloc smokeSessionBloc;
  final int selectedIndex;
  final String label;
  final SmokeState state;
  final ValueChanged<int> onChanged;
  AnimationStatePicker(
      {this.smokeSessionBloc,
      this.selectedIndex,
      this.onChanged,
      this.label,
      this.state});

  @override
  AnimationStatePickerState createState() {
    return new AnimationStatePickerState();
  }
}

class AnimationStatePickerState extends State<AnimationStatePicker> {
  int _focusIndex;
  bool _init = false;

  FixedExtentScrollController scrollController;

  @override
  void initState() {
    super.initState();
    _focusIndex = widget.selectedIndex;
    scrollController = new FixedExtentScrollController(
      initialItem: widget.selectedIndex ?? 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.75 + 50,
      child: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SizedBox(
              height: size.height * 0.75,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: buildAnimationList(),
                  ),
                  Expanded(flex: 1, child: buildBottomBar())
                ],
              ))
        ],
      ),
    );
  }

  StreamBuilder<List<StandAnimation>> buildAnimationList() {
    return StreamBuilder<List<StandAnimation>>(
        stream: widget.smokeSessionBloc.animations,
        initialData: List<StandAnimation>(),
        builder: (context, snapshot) => snapshot.data.length == 0
            ? Container()
            : ListWheelScrollView(
                itemExtent: 50.0,
                controller: scrollController,
                clipToSize: true,
                diameterRatio: 10.0,
                perspective: 0.01,
                onSelectedItemChanged: (int index) {
                  if (index == 0) {
                    print('fake');
                  }
                  widget.onChanged(index);
                  setState(() {
                    _focusIndex = index;
                    Vibrate.feedback(FeedbackType.selection);
                  });
                },
                children: List.generate(
                    snapshot.data.length,
                    (int index) => _createAnimation(index, snapshot.data[index],
                        context, widget.selectedIndex)),
              ));
  }

  StreamBuilder<StandSettings> buildBottomBar() {
    return StreamBuilder<StandSettings>(
        stream: widget.smokeSessionBloc.standSettings,
        initialData: StandSettings.empty(),
        builder: (context, snapshot) {
          var setting = snapshot.data.getStateSetting(widget.state);
          return new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.chevron_left),
              InkWell(
                onTap: () => showBrDialog(context, setting),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                  child: Icon(Icons.settings_brightness),
                ),
              ),
              Text(
                widget.label,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
              ),
              InkWell(
                onTap: () => showSpeedDialog(context, setting),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                  child: Icon(Icons.shutter_speed),
                ),
              ),
              widget.label == "PURGE"
                  ? Container(
                      width: 20.0,
                    )
                  : Icon(Icons.chevron_right),
            ],
          );
        });
  }

  Future<void> showBrDialog(BuildContext context, StateSetting setting) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) => new SizedBox(
            width: 20.0,
            height: MediaQuery.of(context).size.height - 80,
            child: SimpleDialog(
              title: const Text('Set brightness'),
              children: <Widget>[
                SizedBox(
                  height: 400.0,
                  width: 200.0,
                  child: SpringySlider(
                    markCount: 12,
                    positiveColor: Colors.red,
                    negativeColor: Colors.blue,
                    positiveIcon: Icons.brightness_low,
                    negativeIcon: Icons.brightness_high,
                    minValue: 0.0,
                    maxValue: 255.0,
                    initValue: setting.brightness + 0.0,
                    onChanged: (value) => widget.smokeSessionBloc
                        .setBrigtness(value.round(), widget.state),
                  ),
                )
              ],
            )));
  }

  Future<void> showSpeedDialog(BuildContext context, StateSetting setting) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) => new SizedBox(
            width: 20.0,
            height: MediaQuery.of(context).size.height - 80,
            child: SimpleDialog(
              title: const Text('Set speed'),
              children: <Widget>[
                SizedBox(
                  height: 400.0,
                  width: 200.0,
                  child: SpringySlider(
                    markCount: 12,
                    positiveColor: Colors.red,
                    negativeColor: Colors.blue,
                    positiveIcon: Icons.slow_motion_video,
                    negativeIcon: Icons.shutter_speed,
                    minValue: 0.0,
                    maxValue: 600.0,
                    initValue: 600.0 - setting.speed,
                    onChanged: (value) => widget.smokeSessionBloc
                        .setSpeed(value.round(), widget.state),
                  ),
                )
              ],
            )));
  }

  _createAnimation(
      int index, StandAnimation data, BuildContext context, int selected) {
    if (!_init && data.id == selected) {
      _init = true;
      scrollController.jumpToItem(index);
      _focusIndex = index;
    }
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Center(
          child: Text(data.displayName,
              style: TextStyle(
                color: index == selected ? Colors.white : Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: data.id == _focusIndex ? 35.0 : 25.0,
              )),
        ),
      ),
    );
  }
}

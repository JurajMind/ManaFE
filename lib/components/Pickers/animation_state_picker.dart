import 'dart:async';
import 'package:app/const/theme.dart';
import 'package:app/models/SmokeSession/smoke_session.dart';
import 'package:app/models/Stand/animation.dart';
import 'package:app/models/Stand/deviceSetting.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/picker_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vibrate/vibrate.dart';

class AnimationStatePicker extends StatefulWidget {
  final SmokeSessionBloc smokeSessionBloc;
  final int selectedIndex;
  final String label;
  final SmokeState state;
  final ValueChanged<int> onChanged;
  final bool haveRightChevron;
  final bool haveLeftChevron;
  AnimationStatePicker(
      {this.smokeSessionBloc,
      this.selectedIndex,
      this.onChanged,
      this.label,
      this.state,
      this.haveRightChevron,
      this.haveLeftChevron});

  @override
  AnimationStatePickerState createState() {
    return new AnimationStatePickerState();
  }
}

class AnimationStatePickerState extends State<AnimationStatePicker> {
  int _focusIndex;
  bool _init = false;
  bool _isInFocus = true;

  FixedExtentScrollController scrollController;

  @override
  void initState() {
    super.initState();
    print("rebuild");
    _focusIndex = widget.selectedIndex;
    scrollController = new FixedExtentScrollController(
      initialItem: widget.selectedIndex ?? 0,
    );
  }

  @override
  void didChangeDependencies() {
    scrollController.jumpToItem(widget.selectedIndex);
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(AnimationStatePicker oldWidget) {
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      scrollController.animateToItem(widget.selectedIndex,
          curve: Curves.easeIn, duration: const Duration(milliseconds: 300));
    }
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
        builder: (context, snapshot) {
          return snapshot?.data?.length == 0
              ? Container()
              : ListWheelScrollView(
                  itemExtent: 70.0,
                  controller: scrollController,
                  clipToSize: true,
                  diameterRatio: 10.0,
                  perspective: 0.005,
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
                      (int index) => _createAnimation(index,
                          snapshot.data[index], context, widget.selectedIndex)),
                );
        });
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
              widget.haveLeftChevron ?? true
                  ? Icon(Icons.chevron_left)
                  : Container(
                      width: 20.0,
                    ),
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
              widget.haveRightChevron ?? true
                  ? Icon(Icons.chevron_right)
                  : Container(
                      width: 20.0,
                    )
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
              title: Center(child: const Text('Brightness')),
              backgroundColor: Colors.transparent,
              children: <Widget>[
                SizedBox(
                  height: 400.0,
                  width: 200.0,
                  child: SpringySlider(
                    markCount: 12,
                    positiveColor: AppColors.colors[2],
                    negativeColor: AppColors.colors[3],
                    positiveIcon: FontAwesomeIcons.moon,
                    negativeIcon: FontAwesomeIcons.sun,
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
              elevation: 2.0,
              backgroundColor: Colors.transparent,
              title: Center(child: const Text('Speed')),
              children: <Widget>[
                SizedBox(
                  height: 400.0,
                  width: 200.0,
                  child: SpringySlider(
                    markCount: 12,
                    positiveColor: AppColors.colors[0],
                    negativeColor: AppColors.colors[1],
                    positiveIcon: Icons.pause,
                    negativeIcon: Icons.fast_forward,
                    minValue: 0.0,
                    maxValue: 255.0,
                    initValue: 255.0 - setting.speed,
                    onChanged: (value) => widget.smokeSessionBloc
                        .setSpeed(255 - value.round(), widget.state),
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
      padding: const EdgeInsets.all(10.0),
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

import 'dart:async';
import 'dart:math' as math;

import 'package:app/models/SmokeSession/smoke_session.dart';
import 'package:app/models/Stand/animation.dart';
import 'package:app/models/Stand/deviceSetting.dart';
import 'package:app/models/Stand/preset.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/animation_state_picker.dart';
import 'package:app/pages/SmokeSession/preset_picker.dart';
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

class _AnimationsPickerState extends State<AnimationsPicker> {
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  PageController controller;

  SmokeSessionBloc smokeSessionBloc;

  int selectedPresetIndex = 0;

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
              devicePresetPickerBuilder(),
              animationStatePickerBuilder(
                  smokeSessionBloc.standSettings, SmokeState.idle, 'IDLE'),
              animationStatePickerBuilder(
                  smokeSessionBloc.standSettings, SmokeState.puf, 'SMOKING'),
              animationStatePickerBuilder(
                  smokeSessionBloc.standSettings, SmokeState.blow, 'PURGE'),
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

  StreamBuilder<List<DevicePreset>> devicePresetPickerBuilder() {
    return StreamBuilder<List<DevicePreset>>(
        initialData: null,
        stream: smokeSessionBloc.devicePresets,
        builder: (context, snapshot) => snapshot.data == null
            ? CircularProgressIndicator()
            : PresetPicker(
                presetBloc: smokeSessionBloc,
                onChanged: (DevicePreset preset) {
                  this.devicePresetSetChanged(preset, snapshot.data);
                },
              ));
  }

  void devicePresetSetChanged(
      DevicePreset newPreset, List<DevicePreset> presets) {
    smokeSessionBloc.futureDevicePreset.add(newPreset);
  }

  @override
  void didChangeDependencies() {
    smokeSessionBloc = DataProvider.getSmokeSession(context);
    smokeSessionBloc.loadAnimation();
    smokeSessionBloc.loadPresets();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    controller = new PageController();
    super.initState();
  }
}

import 'dart:async';

import 'package:app/components/Pickers/animation_state_picker.dart';
import 'package:app/main.dart';
import 'package:app/models/SmokeSession/smoke_session.dart';
import 'package:app/models/Stand/deviceSetting.dart';
import 'package:app/models/Stand/preset.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/preset_picker.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:openapi/api.dart';

class AnimationsPicker extends StatefulWidget {
  final Stream<List<SmartHookahHelpersAnimation>> aminations;

  const AnimationsPicker({Key key, this.aminations}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _AnimationsPickerState();
  }
}

class _AnimationsPickerState extends State<AnimationsPicker> {
  @override
  initState() {
    super.initState();
    controller = new PageController(initialPage: 1);
  }

  PageController controller;

  SmokeSessionBloc smokeSessionBloc = getIt.get<SmokeSessionBloc>();

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
              //  devicePresetPickerBuilder(),
              animationStatePickerBuilder(
                  smokeSessionBloc.standSettings,
                  SmokeState.idle,
                  AppTranslations.of(context).text("smoke_session.idle"),
                  false,
                  true),
              animationStatePickerBuilder(
                  smokeSessionBloc.standSettings,
                  SmokeState.puf,
                  AppTranslations.of(context).text("smoke_session.inhale"),
                  true,
                  true),
              animationStatePickerBuilder(
                  smokeSessionBloc.standSettings,
                  SmokeState.blow,
                  AppTranslations.of(context).text("smoke_session.blow"),
                  true,
                  false),
            ],
          ),
        ],
      ),
    );
  }

  StreamBuilder<StandSettings> animationStatePickerBuilder(
      Stream<StandSettings> stream,
      SmokeState state,
      String label,
      bool left,
      bool right) {
    return StreamBuilder<StandSettings>(
      initialData: null,
      stream: stream,
      builder: (context, snapshot) => snapshot.data == null
          ? CircularProgressIndicator()
          : AnimationStatePicker(
              smokeSessionBloc: smokeSessionBloc,
              label: label,
              state: state,
              haveLeftChevron: left,
              haveRightChevron: right,
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
    smokeSessionBloc.loadAnimation();
    smokeSessionBloc.loadPresets();
    super.didChangeDependencies();
  }
}

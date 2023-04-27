import 'dart:async';

import 'package:app/components/Pickers/animation_state_picker.dart';
import 'package:app/main.dart';
import 'package:app/models/SmokeSession/smoke_session.dart';
import 'package:app/models/Stand/deviceSetting.dart';
import 'package:app/models/Stand/preset.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:app/pages/SmokeSession/preset_picker.dart';
import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:openapi/openapi.dart';
import 'dart:math' as math;

/// Gauge chart example, where the data does not cover a full revolution in the
/// chart.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SpeedPicker extends StatefulWidget {
  const SpeedPicker({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _SpeedPickerState();
  }
}

class _SpeedPickerState extends State<SpeedPicker> {
  @override
  initState() {
    super.initState();
    controller = new PageController(initialPage: 1);
  }

  PageController? controller;

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
              speedStatePicker(smokeSessionBloc.standSettings, SmokeState.idle,
                  AppTranslations.of(context)!.text("smoke_session.idle"), false, true),
              speedStatePicker(smokeSessionBloc.standSettings, SmokeState.puf,
                  AppTranslations.of(context)!.text("smoke_session.inhale"), true, true),
              speedStatePicker(smokeSessionBloc.standSettings, SmokeState.blow,
                  AppTranslations.of(context)!.text("smoke_session.blow"), true, false),
            ],
          ),
        ],
      ),
    );
  }

  StreamBuilder<StandSettings?> speedStatePicker(
      Stream<StandSettings?> stream, SmokeState state, String label, bool left, bool right) {
    return StreamBuilder<StandSettings?>(
      initialData: null,
      stream: stream,
      builder: (context, snapshot) => snapshot.data == null
          ? CircularProgressIndicator()
          : RotatedBox(
              quarterTurns: 1,
              child: SizedBox(
                width: 20,
                height: 20,
                child: Slider(
                  min: 0.0,
                  max: 255.0,
                  value: 10,
                  onChanged: (double value) {},
                ),
              ),
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

  void devicePresetSetChanged(DevicePreset newPreset, List<DevicePreset>? presets) {
    smokeSessionBloc.futureDevicePreset.add(newPreset);
  }

  @override
  void didChangeDependencies() {
    smokeSessionBloc.loadAnimation();
    smokeSessionBloc.loadPresets();
    super.didChangeDependencies();
  }
}

import 'package:app/models/Stand/preset.dart';
import 'package:rxdart/rxdart.dart';

class DevicePresetBloc {
  static final DevicePresetBloc _instance = new DevicePresetBloc._();

  factory DevicePresetBloc() => DevicePresetBloc._instance;

  DevicePresetBloc._() {}

  BehaviorSubject<List<DevicePreset>> devicePresets =
      new BehaviorSubject<List<DevicePreset>>(
          seedValue: new List<DevicePreset>());
}

import 'package:app/module/smokeSession/smoke_session_bloc.dart';

class DeviceOnline extends SignalData {
  String deviceName;
  String sessionCode;
  DeviceOnline(List data) : super(data);

  DeviceOnline.fromSignal(List data) : super(data) {
    if (data.length < 2) return;

    this.sessionCode = data[0];
    this.deviceName = data[1];
  }
}

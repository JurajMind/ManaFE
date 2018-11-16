import 'package:app/models/Stand/deviceSetting.dart';

class DevicePreset {
  final int id;
  final String name;
  final int personId;
  final StandSettings setting;

  DevicePreset(this.id, this.name, this.personId, this.setting);

  DevicePreset.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        personId = json['Usage'],
        setting = StandSettings.fromJson(['setting'] as Map<String, dynamic>);
}

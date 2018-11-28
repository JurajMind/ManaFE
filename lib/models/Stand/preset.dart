import 'package:app/models/Stand/deviceSetting.dart';

class DevicePreset {
  final int id;
  final String name;
  final int personId;

  DevicePreset(this.id, this.name, this.personId);

  DevicePreset.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        personId = json['Usage'];
  // setting =             StandSettings.fromJson(json['setting'] as Map<String, dynamic>);


  DevicePreset.empty() :id = -1,name= '',personId = 0;
  
}

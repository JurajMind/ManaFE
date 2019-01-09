part of openapi.api;

class DevicePresetDto {
  
  int id = null;
  
  String name = null;
  
  int personId = null;
  
  DeviceSettingDto setting = null;
  DevicePresetDto();

  @override
  String toString() {
    return 'DevicePresetDto[id=$id, name=$name, personId=$personId, setting=$setting, ]';
  }

  DevicePresetDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    personId = json['personId'];
    setting = new DeviceSettingDto.fromJson(json['setting']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'personId': personId,
      'setting': setting
    };
  }

  static List<DevicePresetDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<DevicePresetDto>() : json.map((value) => new DevicePresetDto.fromJson(value)).toList();
  }

  static Map<String, DevicePresetDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, DevicePresetDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new DevicePresetDto.fromJson(value));
    }
    return map;
  }
}


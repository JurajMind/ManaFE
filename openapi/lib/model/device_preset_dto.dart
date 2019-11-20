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
    if (json['id'] == null) {
      id = null;
    } else {
          id = json['id'];
    }
    if (json['name'] == null) {
      name = null;
    } else {
          name = json['name'];
    }
    if (json['personId'] == null) {
      personId = null;
    } else {
          personId = json['personId'];
    }
    if (json['setting'] == null) {
      setting = null;
    } else {
      setting = new DeviceSettingDto.fromJson(json['setting']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (name != null)
      json['name'] = name;
    if (personId != null)
      json['personId'] = personId;
    if (setting != null)
      json['setting'] = setting;
    return json;
  }

  static List<DevicePresetDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<DevicePresetDto>() : json.map((value) => new DevicePresetDto.fromJson(value)).toList();
  }

  static Map<String, DevicePresetDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, DevicePresetDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new DevicePresetDto.fromJson(value));
    }
    return map;
  }
}


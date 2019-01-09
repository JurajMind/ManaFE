part of openapi.api;

class DeviceSettingDto {
  
  ActionSettings puffSettings = null;
  
  ActionSettings blowSettings = null;
  
  ActionSettings idleSettings = null;
  DeviceSettingDto();

  @override
  String toString() {
    return 'DeviceSettingDto[puffSettings=$puffSettings, blowSettings=$blowSettings, idleSettings=$idleSettings, ]';
  }

  DeviceSettingDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    puffSettings = new ActionSettings.fromJson(json['PuffSettings']);
    blowSettings = new ActionSettings.fromJson(json['BlowSettings']);
    idleSettings = new ActionSettings.fromJson(json['IdleSettings']);
  }

  Map<String, dynamic> toJson() {
    return {
      'PuffSettings': puffSettings,
      'BlowSettings': blowSettings,
      'IdleSettings': idleSettings
    };
  }

  static List<DeviceSettingDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<DeviceSettingDto>() : json.map((value) => new DeviceSettingDto.fromJson(value)).toList();
  }

  static Map<String, DeviceSettingDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, DeviceSettingDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new DeviceSettingDto.fromJson(value));
    }
    return map;
  }
}


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
    if (json['PuffSettings'] == null) {
      puffSettings = null;
    } else {
      puffSettings = new ActionSettings.fromJson(json['PuffSettings']);
    }
    if (json['BlowSettings'] == null) {
      blowSettings = null;
    } else {
      blowSettings = new ActionSettings.fromJson(json['BlowSettings']);
    }
    if (json['IdleSettings'] == null) {
      idleSettings = null;
    } else {
      idleSettings = new ActionSettings.fromJson(json['IdleSettings']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (puffSettings != null)
      json['PuffSettings'] = puffSettings;
    if (blowSettings != null)
      json['BlowSettings'] = blowSettings;
    if (idleSettings != null)
      json['IdleSettings'] = idleSettings;
    return json;
  }

  static List<DeviceSettingDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<DeviceSettingDto>() : json.map((value) => new DeviceSettingDto.fromJson(value)).toList();
  }

  static Map<String, DeviceSettingDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, DeviceSettingDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new DeviceSettingDto.fromJson(value));
    }
    return map;
  }
}


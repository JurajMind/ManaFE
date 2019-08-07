part of openapi.api;

class InitDataDto {
  
  SmokeSessionSimpleDto smokeSession = null;
  
  DeviceSettingDto deviceSettings = null;
  InitDataDto();

  @override
  String toString() {
    return 'InitDataDto[smokeSession=$smokeSession, deviceSettings=$deviceSettings, ]';
  }

  InitDataDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['SmokeSession'] == null) {
      smokeSession = null;
    } else {
      smokeSession = new SmokeSessionSimpleDto.fromJson(json['SmokeSession']);
    }
    if (json['DeviceSettings'] == null) {
      deviceSettings = null;
    } else {
      deviceSettings = new DeviceSettingDto.fromJson(json['DeviceSettings']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (smokeSession != null)
      json['SmokeSession'] = smokeSession;
    if (deviceSettings != null)
      json['DeviceSettings'] = deviceSettings;
    return json;
  }

  static List<InitDataDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<InitDataDto>() : json.map((value) => new InitDataDto.fromJson(value)).toList();
  }

  static Map<String, InitDataDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, InitDataDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new InitDataDto.fromJson(value));
    }
    return map;
  }
}


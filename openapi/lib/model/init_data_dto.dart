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
    smokeSession = new SmokeSessionSimpleDto.fromJson(json['SmokeSession']);
    deviceSettings = new DeviceSettingDto.fromJson(json['DeviceSettings']);
  }

  Map<String, dynamic> toJson() {
    return {
      'SmokeSession': smokeSession,
      'DeviceSettings': deviceSettings
    };
  }

  static List<InitDataDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<InitDataDto>() : json.map((value) => new InitDataDto.fromJson(value)).toList();
  }

  static Map<String, InitDataDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, InitDataDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new InitDataDto.fromJson(value));
    }
    return map;
  }
}


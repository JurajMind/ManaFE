part of openapi.api;

class DeviceUpdateInfoDto {
  
  DeviceUpdateDto stableVersion = null;
  
  DeviceUpdateDto betaVersion = null;
  DeviceUpdateInfoDto();

  @override
  String toString() {
    return 'DeviceUpdateInfoDto[stableVersion=$stableVersion, betaVersion=$betaVersion, ]';
  }

  DeviceUpdateInfoDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['StableVersion'] == null) {
      stableVersion = null;
    } else {
      stableVersion = new DeviceUpdateDto.fromJson(json['StableVersion']);
    }
    if (json['BetaVersion'] == null) {
      betaVersion = null;
    } else {
      betaVersion = new DeviceUpdateDto.fromJson(json['BetaVersion']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (stableVersion != null)
      json['StableVersion'] = stableVersion;
    if (betaVersion != null)
      json['BetaVersion'] = betaVersion;
    return json;
  }

  static List<DeviceUpdateInfoDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<DeviceUpdateInfoDto>() : json.map((value) => new DeviceUpdateInfoDto.fromJson(value)).toList();
  }

  static Map<String, DeviceUpdateInfoDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, DeviceUpdateInfoDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new DeviceUpdateInfoDto.fromJson(value));
    }
    return map;
  }
}


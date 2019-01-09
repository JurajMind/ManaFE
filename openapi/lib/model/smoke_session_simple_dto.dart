part of openapi.api;

class SmokeSessionSimpleDto {
  
  String sessionId = null;
  
  DeviceSimpleDto device = null;
  
  DynamicSmokeStatisticRawDto statistic = null;
  
  SmokeSessionMetaDataDto metaData = null;
  
  PlaceSimpleDto place = null;
  SmokeSessionSimpleDto();

  @override
  String toString() {
    return 'SmokeSessionSimpleDto[sessionId=$sessionId, device=$device, statistic=$statistic, metaData=$metaData, place=$place, ]';
  }

  SmokeSessionSimpleDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    sessionId = json['SessionId'];
    device = new DeviceSimpleDto.fromJson(json['Device']);
    statistic = new DynamicSmokeStatisticRawDto.fromJson(json['Statistic']);
    metaData = new SmokeSessionMetaDataDto.fromJson(json['MetaData']);
    place = new PlaceSimpleDto.fromJson(json['Place']);
  }

  Map<String, dynamic> toJson() {
    return {
      'SessionId': sessionId,
      'Device': device,
      'Statistic': statistic,
      'MetaData': metaData,
      'Place': place
    };
  }

  static List<SmokeSessionSimpleDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmokeSessionSimpleDto>() : json.map((value) => new SmokeSessionSimpleDto.fromJson(value)).toList();
  }

  static Map<String, SmokeSessionSimpleDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmokeSessionSimpleDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new SmokeSessionSimpleDto.fromJson(value));
    }
    return map;
  }
}


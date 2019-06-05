part of openapi.api;

class SmokeSessionSimpleDto {
  
  int id = null;

  bool live = null;
  
  String sessionId = null;
  
  DeviceSimpleDto device = null;
  
  DynamicSmokeStatisticRawDto statistic = null;
  
  SmokeSessionMetaDataDto metaData = null;
  
  int placeId = null;
  
  String placeName = null;
  SmokeSessionSimpleDto();

  @override
  String toString() {
    return 'SmokeSessionSimpleDto[id=$id, sessionId=$sessionId, device=$device, statistic=$statistic, metaData=$metaData, placeId=$placeId, placeName=$placeName, ]';
  }

  SmokeSessionSimpleDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['Id'];
    live = json['Live'];
    sessionId = json['SessionId'];
    device = new DeviceSimpleDto.fromJson(json['Device']);
    statistic = new DynamicSmokeStatisticRawDto.fromJson(json['Statistic']);
    metaData = new SmokeSessionMetaDataDto.fromJson(json['MetaData']);
    placeId = json['PlaceId'];
    placeName = json['PlaceName'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'SessionId': sessionId,
      'Device': device,
      'Statistic': statistic,
      'MetaData': metaData,
      'PlaceId': placeId,
      'PlaceName': placeName
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


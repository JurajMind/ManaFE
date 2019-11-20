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
    return 'SmokeSessionSimpleDto[id=$id, live=$live, sessionId=$sessionId, device=$device, statistic=$statistic, metaData=$metaData, placeId=$placeId, placeName=$placeName, ]';
  }

  SmokeSessionSimpleDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
    if (json['Live'] == null) {
      live = null;
    } else {
          live = json['Live'];
    }
    if (json['SessionId'] == null) {
      sessionId = null;
    } else {
          sessionId = json['SessionId'];
    }
    if (json['Device'] == null) {
      device = null;
    } else {
      device = new DeviceSimpleDto.fromJson(json['Device']);
    }
    if (json['Statistic'] == null) {
      statistic = null;
    } else {
      statistic = new DynamicSmokeStatisticRawDto.fromJson(json['Statistic']);
    }
    if (json['MetaData'] == null) {
      metaData = null;
    } else {
      metaData = new SmokeSessionMetaDataDto.fromJson(json['MetaData']);
    }
    if (json['PlaceId'] == null) {
      placeId = null;
    } else {
          placeId = json['PlaceId'];
    }
    if (json['PlaceName'] == null) {
      placeName = null;
    } else {
          placeName = json['PlaceName'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['Id'] = id;
    if (live != null)
      json['Live'] = live;
    if (sessionId != null)
      json['SessionId'] = sessionId;
    if (device != null)
      json['Device'] = device;
    if (statistic != null)
      json['Statistic'] = statistic;
    if (metaData != null)
      json['MetaData'] = metaData;
    if (placeId != null)
      json['PlaceId'] = placeId;
    if (placeName != null)
      json['PlaceName'] = placeName;
    return json;
  }

  static List<SmokeSessionSimpleDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmokeSessionSimpleDto>() : json.map((value) => new SmokeSessionSimpleDto.fromJson(value)).toList();
  }

  static Map<String, SmokeSessionSimpleDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmokeSessionSimpleDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new SmokeSessionSimpleDto.fromJson(value));
    }
    return map;
  }
}


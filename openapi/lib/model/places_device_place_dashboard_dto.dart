part of openapi.api;

class PlacesDevicePlaceDashboardDto {
  
  DeviceSimpleDto device = null;
  
  DynamicSmokeStatisticRawDto statistic = null;
  
  SmokeSessionMetaDataDto metaData = null;
  
  double tobaccoEstimate = null;
  PlacesDevicePlaceDashboardDto();

  @override
  String toString() {
    return 'PlacesDevicePlaceDashboardDto[device=$device, statistic=$statistic, metaData=$metaData, tobaccoEstimate=$tobaccoEstimate, ]';
  }

  PlacesDevicePlaceDashboardDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
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
    if (json['TobaccoEstimate'] == null) {
      tobaccoEstimate = null;
    } else {
          tobaccoEstimate = json['TobaccoEstimate'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (device != null)
      json['Device'] = device;
    if (statistic != null)
      json['Statistic'] = statistic;
    if (metaData != null)
      json['MetaData'] = metaData;
    if (tobaccoEstimate != null)
      json['TobaccoEstimate'] = tobaccoEstimate;
    return json;
  }

  static List<PlacesDevicePlaceDashboardDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlacesDevicePlaceDashboardDto>() : json.map((value) => new PlacesDevicePlaceDashboardDto.fromJson(value)).toList();
  }

  static Map<String, PlacesDevicePlaceDashboardDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlacesDevicePlaceDashboardDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new PlacesDevicePlaceDashboardDto.fromJson(value));
    }
    return map;
  }
}


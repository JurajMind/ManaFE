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
    device = new DeviceSimpleDto.fromJson(json['Device']);
    statistic = new DynamicSmokeStatisticRawDto.fromJson(json['Statistic']);
    metaData = new SmokeSessionMetaDataDto.fromJson(json['MetaData']);
    tobaccoEstimate = json['TobaccoEstimate'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Device': device,
      'Statistic': statistic,
      'MetaData': metaData,
      'TobaccoEstimate': tobaccoEstimate
    };
  }

  static List<PlacesDevicePlaceDashboardDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlacesDevicePlaceDashboardDto>() : json.map((value) => new PlacesDevicePlaceDashboardDto.fromJson(value)).toList();
  }

  static Map<String, PlacesDevicePlaceDashboardDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlacesDevicePlaceDashboardDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new PlacesDevicePlaceDashboardDto.fromJson(value));
    }
    return map;
  }
}


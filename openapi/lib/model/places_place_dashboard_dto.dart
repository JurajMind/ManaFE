part of openapi.api;

class PlacesPlaceDashboardDto {
  
  List<PlacesDevicePlaceDashboardDto> placeDevices = [];
  PlacesPlaceDashboardDto();

  @override
  String toString() {
    return 'PlacesPlaceDashboardDto[placeDevices=$placeDevices, ]';
  }

  PlacesPlaceDashboardDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    placeDevices = PlacesDevicePlaceDashboardDto.listFromJson(json['PlaceDevices']);
  }

  Map<String, dynamic> toJson() {
    return {
      'PlaceDevices': placeDevices
    };
  }

  static List<PlacesPlaceDashboardDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlacesPlaceDashboardDto>() : json.map((value) => new PlacesPlaceDashboardDto.fromJson(value)).toList();
  }

  static Map<String, PlacesPlaceDashboardDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlacesPlaceDashboardDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new PlacesPlaceDashboardDto.fromJson(value));
    }
    return map;
  }
}


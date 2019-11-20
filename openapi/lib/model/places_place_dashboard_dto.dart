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
    if (json['PlaceDevices'] == null) {
      placeDevices = null;
    } else {
      placeDevices = PlacesDevicePlaceDashboardDto.listFromJson(json['PlaceDevices']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (placeDevices != null)
      json['PlaceDevices'] = placeDevices;
    return json;
  }

  static List<PlacesPlaceDashboardDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlacesPlaceDashboardDto>() : json.map((value) => new PlacesPlaceDashboardDto.fromJson(value)).toList();
  }

  static Map<String, PlacesPlaceDashboardDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlacesPlaceDashboardDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new PlacesPlaceDashboardDto.fromJson(value));
    }
    return map;
  }
}


part of openapi.api;

class NearbyPlacesDto {
  
  List<PlaceSimpleDto> nearbyPlaces = [];
  
  bool success = null;
  
  String message = null;
  
  int httpResponseCode = null;
  NearbyPlacesDto();

  @override
  String toString() {
    return 'NearbyPlacesDto[nearbyPlaces=$nearbyPlaces, success=$success, message=$message, httpResponseCode=$httpResponseCode, ]';
  }

  NearbyPlacesDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['NearbyPlaces'] == null) {
      nearbyPlaces = null;
    } else {
      nearbyPlaces = PlaceSimpleDto.listFromJson(json['NearbyPlaces']);
    }
    if (json['Success'] == null) {
      success = null;
    } else {
          success = json['Success'];
    }
    if (json['Message'] == null) {
      message = null;
    } else {
          message = json['Message'];
    }
    if (json['HttpResponseCode'] == null) {
      httpResponseCode = null;
    } else {
          httpResponseCode = json['HttpResponseCode'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (nearbyPlaces != null)
      json['NearbyPlaces'] = nearbyPlaces;
    if (success != null)
      json['Success'] = success;
    if (message != null)
      json['Message'] = message;
    if (httpResponseCode != null)
      json['HttpResponseCode'] = httpResponseCode;
    return json;
  }

  static List<NearbyPlacesDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<NearbyPlacesDto>() : json.map((value) => new NearbyPlacesDto.fromJson(value)).toList();
  }

  static Map<String, NearbyPlacesDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, NearbyPlacesDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new NearbyPlacesDto.fromJson(value));
    }
    return map;
  }
}


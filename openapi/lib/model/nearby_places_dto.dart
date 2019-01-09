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
    nearbyPlaces = PlaceSimpleDto.listFromJson(json['NearbyPlaces']);
    success = json['Success'];
    message = json['Message'];
    httpResponseCode = json['HttpResponseCode'];
  }

  Map<String, dynamic> toJson() {
    return {
      'NearbyPlaces': nearbyPlaces,
      'Success': success,
      'Message': message,
      'HttpResponseCode': httpResponseCode
    };
  }

  static List<NearbyPlacesDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<NearbyPlacesDto>() : json.map((value) => new NearbyPlacesDto.fromJson(value)).toList();
  }

  static Map<String, NearbyPlacesDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, NearbyPlacesDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new NearbyPlacesDto.fromJson(value));
    }
    return map;
  }
}


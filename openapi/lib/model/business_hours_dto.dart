part of openapi.api;

class BusinessHoursDto {
  
  int id = null;
  
  int placeId = null;
  
  int day = null;
  
  String openTine = null;
  
  String closeTime = null;
  BusinessHoursDto();

  @override
  String toString() {
    return 'BusinessHoursDto[id=$id, placeId=$placeId, day=$day, openTine=$openTine, closeTime=$closeTime, ]';
  }

  BusinessHoursDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['Id'];
    placeId = json['PlaceId'];
    day = json['Day'];
    openTine = json['OpenTine'];
    closeTime = json['CloseTime'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'PlaceId': placeId,
      'Day': day,
      'OpenTine': openTine,
      'CloseTime': closeTime
    };
  }

  static List<BusinessHoursDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<BusinessHoursDto>() : json.map((value) => new BusinessHoursDto.fromJson(value)).toList();
  }

  static Map<String, BusinessHoursDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, BusinessHoursDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new BusinessHoursDto.fromJson(value));
    }
    return map;
  }
}


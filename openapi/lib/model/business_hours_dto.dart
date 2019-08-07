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
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
    if (json['PlaceId'] == null) {
      placeId = null;
    } else {
          placeId = json['PlaceId'];
    }
    if (json['Day'] == null) {
      day = null;
    } else {
          day = json['Day'];
    }
    if (json['OpenTine'] == null) {
      openTine = null;
    } else {
          openTine = json['OpenTine'];
    }
    if (json['CloseTime'] == null) {
      closeTime = null;
    } else {
          closeTime = json['CloseTime'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['Id'] = id;
    if (placeId != null)
      json['PlaceId'] = placeId;
    if (day != null)
      json['Day'] = day;
    if (openTine != null)
      json['OpenTine'] = openTine;
    if (closeTime != null)
      json['CloseTime'] = closeTime;
    return json;
  }

  static List<BusinessHoursDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<BusinessHoursDto>() : json.map((value) => new BusinessHoursDto.fromJson(value)).toList();
  }

  static Map<String, BusinessHoursDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, BusinessHoursDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new BusinessHoursDto.fromJson(value));
    }
    return map;
  }
}


part of openapi.api;

class PlaceCalendarDto {
  
  List<PlaceDay> placeDays = [];
  PlaceCalendarDto();

  @override
  String toString() {
    return 'PlaceCalendarDto[placeDays=$placeDays, ]';
  }

  PlaceCalendarDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    placeDays = PlaceDay.listFromJson(json['PlaceDays']);
  }

  Map<String, dynamic> toJson() {
    return {
      'PlaceDays': placeDays
    };
  }

  static List<PlaceCalendarDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlaceCalendarDto>() : json.map((value) => new PlaceCalendarDto.fromJson(value)).toList();
  }

  static Map<String, PlaceCalendarDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlaceCalendarDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new PlaceCalendarDto.fromJson(value));
    }
    return map;
  }
}


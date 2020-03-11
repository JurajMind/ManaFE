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
    if (json['PlaceDays'] == null) {
      placeDays = null;
    } else {
      placeDays = PlaceDay.listFromJson(json['PlaceDays']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (placeDays != null)
      json['PlaceDays'] = placeDays;
    return json;
  }

  static List<PlaceCalendarDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlaceCalendarDto>() : json.map((value) => new PlaceCalendarDto.fromJson(value)).toList();
  }

  static Map<String, PlaceCalendarDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlaceCalendarDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new PlaceCalendarDto.fromJson(value));
    }
    return map;
  }
}


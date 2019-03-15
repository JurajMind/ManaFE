part of openapi.api;

class PlaceDay {
  
  int id = null;
  
  int placeId = null;
  
  DateTime day = null;
  
  String openHour = null;
  
  String closeHour = null;
  
  List<PlaceEvent> placeEvents = [];
  PlaceDay();

  @override
  String toString() {
    return 'PlaceDay[id=$id, placeId=$placeId, day=$day, openHour=$openHour, closeHour=$closeHour, placeEvents=$placeEvents, ]';
  }

  PlaceDay.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['Id'];
    placeId = json['PlaceId'];
    day = json['Day'] == null ? null : DateTime.parse(json['Day']);
    openHour = json['OpenHour'];
    closeHour = json['CloseHour'];
    placeEvents = PlaceEvent.listFromJson(json['PlaceEvents']);
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'PlaceId': placeId,
      'Day': day == null ? '' : day.toUtc().toIso8601String(),
      'OpenHour': openHour,
      'CloseHour': closeHour,
      'PlaceEvents': placeEvents
    };
  }

  static List<PlaceDay> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlaceDay>() : json.map((value) => new PlaceDay.fromJson(value)).toList();
  }

  static Map<String, PlaceDay> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlaceDay>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new PlaceDay.fromJson(value));
    }
    return map;
  }
}


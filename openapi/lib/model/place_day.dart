part of openapi.api;

class PlaceDay {
  
  int id = null;
  
  int placeId = null;
  
  DateTime day = null;
  
  String openHour = null;
  
  String closeHour = null;
  
  List<PlaceEvent> placeEvents = [];
  
  bool success = null;
  
  String message = null;
  
  int httpResponseCode = null;
  PlaceDay();

  @override
  String toString() {
    return 'PlaceDay[id=$id, placeId=$placeId, day=$day, openHour=$openHour, closeHour=$closeHour, placeEvents=$placeEvents, success=$success, message=$message, httpResponseCode=$httpResponseCode, ]';
  }

  PlaceDay.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['Id'];
    placeId = json['PlaceId'];
    day = json['Day'] == null ? null : DateTime.parse(json['Day']);
    openHour = json['OpenHour'];
    closeHour = json['CloseHour'];
    placeEvents = PlaceEvent.listFromJson(json['PlaceEvents']);
    success = json['Success'];
    message = json['Message'];
    httpResponseCode = json['HttpResponseCode'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'PlaceId': placeId,
      'Day': day == null ? '' : day.toUtc().toIso8601String(),
      'OpenHour': openHour,
      'CloseHour': closeHour,
      'PlaceEvents': placeEvents,
      'Success': success,
      'Message': message,
      'HttpResponseCode': httpResponseCode
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


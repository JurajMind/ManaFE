part of openapi.api;

class PlaceCalendar {
  
  List<PlaceDay> placeDays = [];
  
  bool success = null;
  
  String message = null;
  
  int httpResponseCode = null;
  PlaceCalendar();

  @override
  String toString() {
    return 'PlaceCalendar[placeDays=$placeDays, success=$success, message=$message, httpResponseCode=$httpResponseCode, ]';
  }

  PlaceCalendar.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    placeDays = PlaceDay.listFromJson(json['PlaceDays']);
    success = json['Success'];
    message = json['Message'];
    httpResponseCode = json['HttpResponseCode'];
  }

  Map<String, dynamic> toJson() {
    return {
      'PlaceDays': placeDays,
      'Success': success,
      'Message': message,
      'HttpResponseCode': httpResponseCode
    };
  }

  static List<PlaceCalendar> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlaceCalendar>() : json.map((value) => new PlaceCalendar.fromJson(value)).toList();
  }

  static Map<String, PlaceCalendar> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlaceCalendar>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new PlaceCalendar.fromJson(value));
    }
    return map;
  }
}


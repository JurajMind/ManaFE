part of openapi.api;

class OpeningDay {
  
  int day = null;
  
  String openTime = null;
  
  String closeTime = null;
  OpeningDay();

  @override
  String toString() {
    return 'OpeningDay[day=$day, openTime=$openTime, closeTime=$closeTime, ]';
  }

  OpeningDay.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    day = json['Day'];
    openTime = json['OpenTime'];
    closeTime = json['CloseTime'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Day': day,
      'OpenTime': openTime,
      'CloseTime': closeTime
    };
  }

  static List<OpeningDay> listFromJson(List<dynamic> json) {
    return json == null ? new List<OpeningDay>() : json.map((value) => new OpeningDay.fromJson(value)).toList();
  }

  static Map<String, OpeningDay> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, OpeningDay>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new OpeningDay.fromJson(value));
    }
    return map;
  }
}


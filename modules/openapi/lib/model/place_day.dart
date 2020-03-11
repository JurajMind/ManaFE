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
      day = DateTime.parse(json['Day']);
    }
    if (json['OpenHour'] == null) {
      openHour = null;
    } else {
          openHour = json['OpenHour'];
    }
    if (json['CloseHour'] == null) {
      closeHour = null;
    } else {
          closeHour = json['CloseHour'];
    }
    if (json['PlaceEvents'] == null) {
      placeEvents = null;
    } else {
      placeEvents = PlaceEvent.listFromJson(json['PlaceEvents']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['Id'] = id;
    if (placeId != null)
      json['PlaceId'] = placeId;
    if (day != null)
      json['Day'] = day == null ? null : day.toUtc().toIso8601String();
    if (openHour != null)
      json['OpenHour'] = openHour;
    if (closeHour != null)
      json['CloseHour'] = closeHour;
    if (placeEvents != null)
      json['PlaceEvents'] = placeEvents;
    return json;
  }

  static List<PlaceDay> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlaceDay>() : json.map((value) => new PlaceDay.fromJson(value)).toList();
  }

  static Map<String, PlaceDay> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlaceDay>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new PlaceDay.fromJson(value));
    }
    return map;
  }
}


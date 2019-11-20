part of openapi.api;

class PlaceEventCollection {
  
  List<PlaceEvent> eventCollection = [];
  
  bool success = null;
  
  String message = null;
  
  int httpResponseCode = null;
  PlaceEventCollection();

  @override
  String toString() {
    return 'PlaceEventCollection[eventCollection=$eventCollection, success=$success, message=$message, httpResponseCode=$httpResponseCode, ]';
  }

  PlaceEventCollection.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['EventCollection'] == null) {
      eventCollection = null;
    } else {
      eventCollection = PlaceEvent.listFromJson(json['EventCollection']);
    }
    if (json['Success'] == null) {
      success = null;
    } else {
          success = json['Success'];
    }
    if (json['Message'] == null) {
      message = null;
    } else {
          message = json['Message'];
    }
    if (json['HttpResponseCode'] == null) {
      httpResponseCode = null;
    } else {
          httpResponseCode = json['HttpResponseCode'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (eventCollection != null)
      json['EventCollection'] = eventCollection;
    if (success != null)
      json['Success'] = success;
    if (message != null)
      json['Message'] = message;
    if (httpResponseCode != null)
      json['HttpResponseCode'] = httpResponseCode;
    return json;
  }

  static List<PlaceEventCollection> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlaceEventCollection>() : json.map((value) => new PlaceEventCollection.fromJson(value)).toList();
  }

  static Map<String, PlaceEventCollection> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlaceEventCollection>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new PlaceEventCollection.fromJson(value));
    }
    return map;
  }
}


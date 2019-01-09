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
    eventCollection = PlaceEvent.listFromJson(json['EventCollection']);
    success = json['Success'];
    message = json['Message'];
    httpResponseCode = json['HttpResponseCode'];
  }

  Map<String, dynamic> toJson() {
    return {
      'EventCollection': eventCollection,
      'Success': success,
      'Message': message,
      'HttpResponseCode': httpResponseCode
    };
  }

  static List<PlaceEventCollection> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlaceEventCollection>() : json.map((value) => new PlaceEventCollection.fromJson(value)).toList();
  }

  static Map<String, PlaceEventCollection> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlaceEventCollection>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new PlaceEventCollection.fromJson(value));
    }
    return map;
  }
}


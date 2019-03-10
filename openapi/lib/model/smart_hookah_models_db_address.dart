part of openapi.api;

class SmartHookahModelsDbAddress {
  
  int id = null;
  
  String street = null;
  
  String city = null;
  
  String number = null;
  
  String ZIP = null;
  
  String lat = null;
  
  String lng = null;
  
  SystemDataEntitySpatialDbGeography location = null;
  SmartHookahModelsDbAddress();

  @override
  String toString() {
    return 'SmartHookahModelsDbAddress[id=$id, street=$street, city=$city, number=$number, ZIP=$ZIP, lat=$lat, lng=$lng, location=$location, ]';
  }

  SmartHookahModelsDbAddress.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['Id'];
    street = json['Street'];
    city = json['City'];
    number = json['Number'];
    ZIP = json['ZIP'];
    lat = json['Lat'];
    lng = json['Lng'];
    location = new SystemDataEntitySpatialDbGeography.fromJson(json['Location']);
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Street': street,
      'City': city,
      'Number': number,
      'ZIP': ZIP,
      'Lat': lat,
      'Lng': lng,
      'Location': location
    };
  }

  static List<SmartHookahModelsDbAddress> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahModelsDbAddress>() : json.map((value) => new SmartHookahModelsDbAddress.fromJson(value)).toList();
  }

  static Map<String, SmartHookahModelsDbAddress> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahModelsDbAddress>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahModelsDbAddress.fromJson(value));
    }
    return map;
  }
}


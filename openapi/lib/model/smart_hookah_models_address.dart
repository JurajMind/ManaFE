part of openapi.api;

class SmartHookahModelsAddress {
  int id = null;

  String street = null;

  String city = null;

  String number = null;

  String ZIP = null;

  String lat = null;

  String lng = null;

  SmartHookahModelsAddress();

  @override
  String toString() {
    return 'SmartHookahModelsAddress[id=$id, street=$street, city=$city, number=$number, ZIP=$ZIP, lat=$lat, lng=$lng, ]';
  }

  SmartHookahModelsAddress.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['Id'];
    street = json['Street'];
    city = json['City'];
    number = json['Number'];
    ZIP = json['ZIP'];
    lat = json['Lat'];
    lng = json['Lng'];
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
    };
  }

  static List<SmartHookahModelsAddress> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<SmartHookahModelsAddress>()
        : json
            .map((value) => new SmartHookahModelsAddress.fromJson(value))
            .toList();
  }

  static Map<String, SmartHookahModelsAddress> mapFromJson(
      Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahModelsAddress>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) =>
          map[key] = new SmartHookahModelsAddress.fromJson(value));
    }
    return map;
  }
}

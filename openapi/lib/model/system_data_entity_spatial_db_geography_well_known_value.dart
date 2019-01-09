part of openapi.api;

class SystemDataEntitySpatialDbGeographyWellKnownValue {
  
  int coordinateSystemId = null;
  
  String wellKnownText = null;
  
  String wellKnownBinary = null;
  SystemDataEntitySpatialDbGeographyWellKnownValue();

  @override
  String toString() {
    return 'SystemDataEntitySpatialDbGeographyWellKnownValue[coordinateSystemId=$coordinateSystemId, wellKnownText=$wellKnownText, wellKnownBinary=$wellKnownBinary, ]';
  }

  SystemDataEntitySpatialDbGeographyWellKnownValue.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    coordinateSystemId = json['CoordinateSystemId'];
    wellKnownText = json['WellKnownText'];
    wellKnownBinary = json['WellKnownBinary'];
  }

  Map<String, dynamic> toJson() {
    return {
      'CoordinateSystemId': coordinateSystemId,
      'WellKnownText': wellKnownText,
      'WellKnownBinary': wellKnownBinary
    };
  }

  static List<SystemDataEntitySpatialDbGeographyWellKnownValue> listFromJson(List<dynamic> json) {
    return json == null ? new List<SystemDataEntitySpatialDbGeographyWellKnownValue>() : json.map((value) => new SystemDataEntitySpatialDbGeographyWellKnownValue.fromJson(value)).toList();
  }

  static Map<String, SystemDataEntitySpatialDbGeographyWellKnownValue> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SystemDataEntitySpatialDbGeographyWellKnownValue>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new SystemDataEntitySpatialDbGeographyWellKnownValue.fromJson(value));
    }
    return map;
  }
}


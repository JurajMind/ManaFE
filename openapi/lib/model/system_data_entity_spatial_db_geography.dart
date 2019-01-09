part of openapi.api;

class SystemDataEntitySpatialDbGeography {
  
  SystemDataEntitySpatialDbGeographyWellKnownValue geography = null;
  SystemDataEntitySpatialDbGeography();

  @override
  String toString() {
    return 'SystemDataEntitySpatialDbGeography[geography=$geography, ]';
  }

  SystemDataEntitySpatialDbGeography.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    geography = new SystemDataEntitySpatialDbGeographyWellKnownValue.fromJson(json['Geography']);
  }

  Map<String, dynamic> toJson() {
    return {
      'Geography': geography
    };
  }

  static List<SystemDataEntitySpatialDbGeography> listFromJson(List<dynamic> json) {
    return json == null ? new List<SystemDataEntitySpatialDbGeography>() : json.map((value) => new SystemDataEntitySpatialDbGeography.fromJson(value)).toList();
  }

  static Map<String, SystemDataEntitySpatialDbGeography> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SystemDataEntitySpatialDbGeography>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new SystemDataEntitySpatialDbGeography.fromJson(value));
    }
    return map;
  }
}


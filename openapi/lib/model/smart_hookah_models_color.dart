part of openapi.api;

class SmartHookahModelsColor {
  
  int hue = null;
  
  int saturation = null;
  
  int value = null;
  SmartHookahModelsColor();

  @override
  String toString() {
    return 'SmartHookahModelsColor[hue=$hue, saturation=$saturation, value=$value, ]';
  }

  SmartHookahModelsColor.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    hue = json['Hue'];
    saturation = json['Saturation'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Hue': hue,
      'Saturation': saturation,
      'Value': value
    };
  }

  static List<SmartHookahModelsColor> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahModelsColor>() : json.map((value) => new SmartHookahModelsColor.fromJson(value)).toList();
  }

  static Map<String, SmartHookahModelsColor> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahModelsColor>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahModelsColor.fromJson(value));
    }
    return map;
  }
}


part of openapi.api;

class SmartHookahModelsDbColor {
  
  int hue = null;
  
  int saturation = null;
  
  int value = null;
  SmartHookahModelsDbColor();

  @override
  String toString() {
    return 'SmartHookahModelsDbColor[hue=$hue, saturation=$saturation, value=$value, ]';
  }

  SmartHookahModelsDbColor.fromJson(Map<String, dynamic> json) {
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

  static List<SmartHookahModelsDbColor> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahModelsDbColor>() : json.map((value) => new SmartHookahModelsDbColor.fromJson(value)).toList();
  }

  static Map<String, SmartHookahModelsDbColor> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahModelsDbColor>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahModelsDbColor.fromJson(value));
    }
    return map;
  }
}


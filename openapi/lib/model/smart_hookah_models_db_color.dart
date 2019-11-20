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
    if (json['Hue'] == null) {
      hue = null;
    } else {
          hue = json['Hue'];
    }
    if (json['Saturation'] == null) {
      saturation = null;
    } else {
          saturation = json['Saturation'];
    }
    if (json['Value'] == null) {
      value = null;
    } else {
          value = json['Value'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (hue != null)
      json['Hue'] = hue;
    if (saturation != null)
      json['Saturation'] = saturation;
    if (value != null)
      json['Value'] = value;
    return json;
  }

  static List<SmartHookahModelsDbColor> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahModelsDbColor>() : json.map((value) => new SmartHookahModelsDbColor.fromJson(value)).toList();
  }

  static Map<String, SmartHookahModelsDbColor> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahModelsDbColor>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahModelsDbColor.fromJson(value));
    }
    return map;
  }
}


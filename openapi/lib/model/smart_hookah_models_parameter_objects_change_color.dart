part of openapi.api;

class SmartHookahModelsParameterObjectsChangeColor {
  
  SmartHookahModelsDbColor color = null;
  
  int type = null;
  //enum typeEnum {  0,  1,  2,  };{
  SmartHookahModelsParameterObjectsChangeColor();

  @override
  String toString() {
    return 'SmartHookahModelsParameterObjectsChangeColor[color=$color, type=$type, ]';
  }

  SmartHookahModelsParameterObjectsChangeColor.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    color = new SmartHookahModelsDbColor.fromJson(json['Color']);
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Color': color,
      'Type': type
    };
  }

  static List<SmartHookahModelsParameterObjectsChangeColor> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahModelsParameterObjectsChangeColor>() : json.map((value) => new SmartHookahModelsParameterObjectsChangeColor.fromJson(value)).toList();
  }

  static Map<String, SmartHookahModelsParameterObjectsChangeColor> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahModelsParameterObjectsChangeColor>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahModelsParameterObjectsChangeColor.fromJson(value));
    }
    return map;
  }
}


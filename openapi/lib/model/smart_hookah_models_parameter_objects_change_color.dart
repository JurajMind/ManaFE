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
    if (json['Color'] == null) {
      color = null;
    } else {
      color = new SmartHookahModelsDbColor.fromJson(json['Color']);
    }
    if (json['Type'] == null) {
      type = null;
    } else {
          type = json['Type'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (color != null)
      json['Color'] = color;
    if (type != null)
      json['Type'] = type;
    return json;
  }

  static List<SmartHookahModelsParameterObjectsChangeColor> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahModelsParameterObjectsChangeColor>() : json.map((value) => new SmartHookahModelsParameterObjectsChangeColor.fromJson(value)).toList();
  }

  static Map<String, SmartHookahModelsParameterObjectsChangeColor> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahModelsParameterObjectsChangeColor>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahModelsParameterObjectsChangeColor.fromJson(value));
    }
    return map;
  }
}


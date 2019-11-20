part of openapi.api;

class SmartHookahModelsParameterObjectsChangeSpeed {
  
  int speed = null;
  
  int type = null;
  //enum typeEnum {  0,  1,  2,  };{
  SmartHookahModelsParameterObjectsChangeSpeed();

  @override
  String toString() {
    return 'SmartHookahModelsParameterObjectsChangeSpeed[speed=$speed, type=$type, ]';
  }

  SmartHookahModelsParameterObjectsChangeSpeed.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Speed'] == null) {
      speed = null;
    } else {
          speed = json['Speed'];
    }
    if (json['Type'] == null) {
      type = null;
    } else {
          type = json['Type'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (speed != null)
      json['Speed'] = speed;
    if (type != null)
      json['Type'] = type;
    return json;
  }

  static List<SmartHookahModelsParameterObjectsChangeSpeed> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahModelsParameterObjectsChangeSpeed>() : json.map((value) => new SmartHookahModelsParameterObjectsChangeSpeed.fromJson(value)).toList();
  }

  static Map<String, SmartHookahModelsParameterObjectsChangeSpeed> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahModelsParameterObjectsChangeSpeed>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahModelsParameterObjectsChangeSpeed.fromJson(value));
    }
    return map;
  }
}


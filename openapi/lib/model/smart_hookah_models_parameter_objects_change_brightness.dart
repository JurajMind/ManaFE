part of openapi.api;

class SmartHookahModelsParameterObjectsChangeBrightness {
  
  int brightness = null;
  
  int type = null;
  //enum typeEnum {  0,  1,  2,  };{
  SmartHookahModelsParameterObjectsChangeBrightness();

  @override
  String toString() {
    return 'SmartHookahModelsParameterObjectsChangeBrightness[brightness=$brightness, type=$type, ]';
  }

  SmartHookahModelsParameterObjectsChangeBrightness.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    brightness = json['Brightness'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Brightness': brightness,
      'Type': type
    };
  }

  static List<SmartHookahModelsParameterObjectsChangeBrightness> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahModelsParameterObjectsChangeBrightness>() : json.map((value) => new SmartHookahModelsParameterObjectsChangeBrightness.fromJson(value)).toList();
  }

  static Map<String, SmartHookahModelsParameterObjectsChangeBrightness> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahModelsParameterObjectsChangeBrightness>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahModelsParameterObjectsChangeBrightness.fromJson(value));
    }
    return map;
  }
}


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
    if (json['Brightness'] == null) {
      brightness = null;
    } else {
          brightness = json['Brightness'];
    }
    if (json['Type'] == null) {
      type = null;
    } else {
          type = json['Type'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (brightness != null)
      json['Brightness'] = brightness;
    if (type != null)
      json['Type'] = type;
    return json;
  }

  static List<SmartHookahModelsParameterObjectsChangeBrightness> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahModelsParameterObjectsChangeBrightness>() : json.map((value) => new SmartHookahModelsParameterObjectsChangeBrightness.fromJson(value)).toList();
  }

  static Map<String, SmartHookahModelsParameterObjectsChangeBrightness> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahModelsParameterObjectsChangeBrightness>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahModelsParameterObjectsChangeBrightness.fromJson(value));
    }
    return map;
  }
}


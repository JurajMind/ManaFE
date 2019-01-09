part of openapi.api;

class ActionSettings {
  
  SmartHookahModelsColor color = null;
  
  int animationId = null;
  
  int brightness = null;
  
  int speed = null;
  ActionSettings();

  @override
  String toString() {
    return 'ActionSettings[color=$color, animationId=$animationId, brightness=$brightness, speed=$speed, ]';
  }

  ActionSettings.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    color = new SmartHookahModelsColor.fromJson(json['Color']);
    animationId = json['AnimationId'];
    brightness = json['Brightness'];
    speed = json['Speed'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Color': color,
      'AnimationId': animationId,
      'Brightness': brightness,
      'Speed': speed
    };
  }

  static List<ActionSettings> listFromJson(List<dynamic> json) {
    return json == null ? new List<ActionSettings>() : json.map((value) => new ActionSettings.fromJson(value)).toList();
  }

  static Map<String, ActionSettings> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, ActionSettings>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new ActionSettings.fromJson(value));
    }
    return map;
  }
}


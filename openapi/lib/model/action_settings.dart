part of openapi.api;

class ActionSettings {
  
  SmartHookahModelsDbColor color = null;
  
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
    if (json['Color'] == null) {
      color = null;
    } else {
      color = new SmartHookahModelsDbColor.fromJson(json['Color']);
    }
    if (json['AnimationId'] == null) {
      animationId = null;
    } else {
          animationId = json['AnimationId'];
    }
    if (json['Brightness'] == null) {
      brightness = null;
    } else {
          brightness = json['Brightness'];
    }
    if (json['Speed'] == null) {
      speed = null;
    } else {
          speed = json['Speed'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (color != null)
      json['Color'] = color;
    if (animationId != null)
      json['AnimationId'] = animationId;
    if (brightness != null)
      json['Brightness'] = brightness;
    if (speed != null)
      json['Speed'] = speed;
    return json;
  }

  static List<ActionSettings> listFromJson(List<dynamic> json) {
    return json == null ? new List<ActionSettings>() : json.map((value) => new ActionSettings.fromJson(value)).toList();
  }

  static Map<String, ActionSettings> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, ActionSettings>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new ActionSettings.fromJson(value));
    }
    return map;
  }
}


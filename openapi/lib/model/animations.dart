part of openapi.api;

class Animations {
  
  List<SmartHookahHelpersAnimation> animations = [];
  
  bool success = null;
  
  String message = null;
  
  int httpResponseCode = null;
  Animations();

  @override
  String toString() {
    return 'Animations[animations=$animations, success=$success, message=$message, httpResponseCode=$httpResponseCode, ]';
  }

  Animations.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Animations'] == null) {
      animations = null;
    } else {
      animations = SmartHookahHelpersAnimation.listFromJson(json['Animations']);
    }
    if (json['Success'] == null) {
      success = null;
    } else {
          success = json['Success'];
    }
    if (json['Message'] == null) {
      message = null;
    } else {
          message = json['Message'];
    }
    if (json['HttpResponseCode'] == null) {
      httpResponseCode = null;
    } else {
          httpResponseCode = json['HttpResponseCode'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (animations != null)
      json['Animations'] = animations;
    if (success != null)
      json['Success'] = success;
    if (message != null)
      json['Message'] = message;
    if (httpResponseCode != null)
      json['HttpResponseCode'] = httpResponseCode;
    return json;
  }

  static List<Animations> listFromJson(List<dynamic> json) {
    return json == null ? new List<Animations>() : json.map((value) => new Animations.fromJson(value)).toList();
  }

  static Map<String, Animations> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Animations>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new Animations.fromJson(value));
    }
    return map;
  }
}


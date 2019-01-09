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
    animations = SmartHookahHelpersAnimation.listFromJson(json['Animations']);
    success = json['Success'];
    message = json['Message'];
    httpResponseCode = json['HttpResponseCode'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Animations': animations,
      'Success': success,
      'Message': message,
      'HttpResponseCode': httpResponseCode
    };
  }

  static List<Animations> listFromJson(List<dynamic> json) {
    return json == null ? new List<Animations>() : json.map((value) => new Animations.fromJson(value)).toList();
  }

  static Map<String, Animations> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Animations>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Animations.fromJson(value));
    }
    return map;
  }
}


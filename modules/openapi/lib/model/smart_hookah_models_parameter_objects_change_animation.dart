part of openapi.api;

class SmartHookahModelsParameterObjectsChangeAnimation {
  
  int animationId = null;
  
  int type = null;
  //enum typeEnum {  0,  1,  2,  };{
  SmartHookahModelsParameterObjectsChangeAnimation();

  @override
  String toString() {
    return 'SmartHookahModelsParameterObjectsChangeAnimation[animationId=$animationId, type=$type, ]';
  }

  SmartHookahModelsParameterObjectsChangeAnimation.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['AnimationId'] == null) {
      animationId = null;
    } else {
          animationId = json['AnimationId'];
    }
    if (json['Type'] == null) {
      type = null;
    } else {
          type = json['Type'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (animationId != null)
      json['AnimationId'] = animationId;
    if (type != null)
      json['Type'] = type;
    return json;
  }

  static List<SmartHookahModelsParameterObjectsChangeAnimation> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahModelsParameterObjectsChangeAnimation>() : json.map((value) => new SmartHookahModelsParameterObjectsChangeAnimation.fromJson(value)).toList();
  }

  static Map<String, SmartHookahModelsParameterObjectsChangeAnimation> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahModelsParameterObjectsChangeAnimation>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahModelsParameterObjectsChangeAnimation.fromJson(value));
    }
    return map;
  }
}


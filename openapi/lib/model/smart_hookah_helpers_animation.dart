part of openapi.api;

class SmartHookahHelpersAnimation {
  
  int id = null;
  
  String displayName = null;
  
  int versionFrom = null;
  
  int versionTo = null;
  
  int usage = null;
  //enum usageEnum {  0,  1,  2,  4,  6,  7,  };{
  
  bool haveColor = null;
  SmartHookahHelpersAnimation();

  @override
  String toString() {
    return 'SmartHookahHelpersAnimation[id=$id, displayName=$displayName, versionFrom=$versionFrom, versionTo=$versionTo, usage=$usage, haveColor=$haveColor, ]';
  }

  SmartHookahHelpersAnimation.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['Id'];
    displayName = json['DisplayName'];
    versionFrom = json['VersionFrom'];
    versionTo = json['VersionTo'];
    usage = json['Usage'];
    haveColor = json['HaveColor'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'DisplayName': displayName,
      'VersionFrom': versionFrom,
      'VersionTo': versionTo,
      'Usage': usage,
      'HaveColor': haveColor
    };
  }

  static List<SmartHookahHelpersAnimation> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahHelpersAnimation>() : json.map((value) => new SmartHookahHelpersAnimation.fromJson(value)).toList();
  }

  static Map<String, SmartHookahHelpersAnimation> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahHelpersAnimation>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahHelpersAnimation.fromJson(value));
    }
    return map;
  }
}


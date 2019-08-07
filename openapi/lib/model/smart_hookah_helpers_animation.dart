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
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
    if (json['DisplayName'] == null) {
      displayName = null;
    } else {
          displayName = json['DisplayName'];
    }
    if (json['VersionFrom'] == null) {
      versionFrom = null;
    } else {
          versionFrom = json['VersionFrom'];
    }
    if (json['VersionTo'] == null) {
      versionTo = null;
    } else {
          versionTo = json['VersionTo'];
    }
    if (json['Usage'] == null) {
      usage = null;
    } else {
          usage = json['Usage'];
    }
    if (json['HaveColor'] == null) {
      haveColor = null;
    } else {
          haveColor = json['HaveColor'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['Id'] = id;
    if (displayName != null)
      json['DisplayName'] = displayName;
    if (versionFrom != null)
      json['VersionFrom'] = versionFrom;
    if (versionTo != null)
      json['VersionTo'] = versionTo;
    if (usage != null)
      json['Usage'] = usage;
    if (haveColor != null)
      json['HaveColor'] = haveColor;
    return json;
  }

  static List<SmartHookahHelpersAnimation> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahHelpersAnimation>() : json.map((value) => new SmartHookahHelpersAnimation.fromJson(value)).toList();
  }

  static Map<String, SmartHookahHelpersAnimation> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahHelpersAnimation>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahHelpersAnimation.fromJson(value));
    }
    return map;
  }
}


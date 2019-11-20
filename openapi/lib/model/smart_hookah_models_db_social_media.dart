part of openapi.api;

class SmartHookahModelsDbSocialMedia {
  
  int id = null;
  
  String code = null;
  
  String url = null;
  SmartHookahModelsDbSocialMedia();

  @override
  String toString() {
    return 'SmartHookahModelsDbSocialMedia[id=$id, code=$code, url=$url, ]';
  }

  SmartHookahModelsDbSocialMedia.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
    if (json['Code'] == null) {
      code = null;
    } else {
          code = json['Code'];
    }
    if (json['Url'] == null) {
      url = null;
    } else {
          url = json['Url'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['Id'] = id;
    if (code != null)
      json['Code'] = code;
    if (url != null)
      json['Url'] = url;
    return json;
  }

  static List<SmartHookahModelsDbSocialMedia> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahModelsDbSocialMedia>() : json.map((value) => new SmartHookahModelsDbSocialMedia.fromJson(value)).toList();
  }

  static Map<String, SmartHookahModelsDbSocialMedia> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahModelsDbSocialMedia>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahModelsDbSocialMedia.fromJson(value));
    }
    return map;
  }
}


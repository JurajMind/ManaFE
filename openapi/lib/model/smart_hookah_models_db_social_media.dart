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
    id = json['Id'];
    code = json['Code'];
    url = json['Url'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Code': code,
      'Url': url
    };
  }

  static List<SmartHookahModelsDbSocialMedia> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahModelsDbSocialMedia>() : json.map((value) => new SmartHookahModelsDbSocialMedia.fromJson(value)).toList();
  }

  static Map<String, SmartHookahModelsDbSocialMedia> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahModelsDbSocialMedia>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahModelsDbSocialMedia.fromJson(value));
    }
    return map;
  }
}


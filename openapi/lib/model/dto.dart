part of openapi.api;

class Dto {
  
  bool success = null;
  
  String message = null;
  
  int httpResponseCode = null;
  Dto();

  @override
  String toString() {
    return 'Dto[success=$success, message=$message, httpResponseCode=$httpResponseCode, ]';
  }

  Dto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
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
    if (success != null)
      json['Success'] = success;
    if (message != null)
      json['Message'] = message;
    if (httpResponseCode != null)
      json['HttpResponseCode'] = httpResponseCode;
    return json;
  }

  static List<Dto> listFromJson(List<dynamic> json) {
    return json == null ? new List<Dto>() : json.map((value) => new Dto.fromJson(value)).toList();
  }

  static Map<String, Dto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Dto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new Dto.fromJson(value));
    }
    return map;
  }
}


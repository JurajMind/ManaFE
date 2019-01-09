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
    success = json['Success'];
    message = json['Message'];
    httpResponseCode = json['HttpResponseCode'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Success': success,
      'Message': message,
      'HttpResponseCode': httpResponseCode
    };
  }

  static List<Dto> listFromJson(List<dynamic> json) {
    return json == null ? new List<Dto>() : json.map((value) => new Dto.fromJson(value)).toList();
  }

  static Map<String, Dto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Dto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Dto.fromJson(value));
    }
    return map;
  }
}


part of openapi.api;

class Validation {
  
  String id = null;
  
  int flag = null;
  //enum flagEnum {  0,  1,  };{
  
  bool success = null;
  
  String message = null;
  
  int httpResponseCode = null;
  Validation();

  @override
  String toString() {
    return 'Validation[id=$id, flag=$flag, success=$success, message=$message, httpResponseCode=$httpResponseCode, ]';
  }

  Validation.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['Id'];
    flag = json['Flag'];
    success = json['Success'];
    message = json['Message'];
    httpResponseCode = json['HttpResponseCode'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Flag': flag,
      'Success': success,
      'Message': message,
      'HttpResponseCode': httpResponseCode
    };
  }

  static List<Validation> listFromJson(List<dynamic> json) {
    return json == null ? new List<Validation>() : json.map((value) => new Validation.fromJson(value)).toList();
  }

  static Map<String, Validation> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Validation>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Validation.fromJson(value));
    }
    return map;
  }
}


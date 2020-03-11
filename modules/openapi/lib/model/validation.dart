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
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
    if (json['Flag'] == null) {
      flag = null;
    } else {
          flag = json['Flag'];
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
    if (id != null)
      json['Id'] = id;
    if (flag != null)
      json['Flag'] = flag;
    if (success != null)
      json['Success'] = success;
    if (message != null)
      json['Message'] = message;
    if (httpResponseCode != null)
      json['HttpResponseCode'] = httpResponseCode;
    return json;
  }

  static List<Validation> listFromJson(List<dynamic> json) {
    return json == null ? new List<Validation>() : json.map((value) => new Validation.fromJson(value)).toList();
  }

  static Map<String, Validation> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Validation>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new Validation.fromJson(value));
    }
    return map;
  }
}


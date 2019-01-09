part of openapi.api;

class MixCreators {
  
  List<MixCreator> mixCreatorsList = [];
  
  bool success = null;
  
  String message = null;
  
  int httpResponseCode = null;
  MixCreators();

  @override
  String toString() {
    return 'MixCreators[mixCreatorsList=$mixCreatorsList, success=$success, message=$message, httpResponseCode=$httpResponseCode, ]';
  }

  MixCreators.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    mixCreatorsList = MixCreator.listFromJson(json['MixCreatorsList']);
    success = json['Success'];
    message = json['Message'];
    httpResponseCode = json['HttpResponseCode'];
  }

  Map<String, dynamic> toJson() {
    return {
      'MixCreatorsList': mixCreatorsList,
      'Success': success,
      'Message': message,
      'HttpResponseCode': httpResponseCode
    };
  }

  static List<MixCreators> listFromJson(List<dynamic> json) {
    return json == null ? new List<MixCreators>() : json.map((value) => new MixCreators.fromJson(value)).toList();
  }

  static Map<String, MixCreators> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, MixCreators>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new MixCreators.fromJson(value));
    }
    return map;
  }
}


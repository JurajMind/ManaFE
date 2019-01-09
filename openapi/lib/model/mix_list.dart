part of openapi.api;

class MixList {
  
  List<Mix> mixes = [];
  
  bool success = null;
  
  String message = null;
  
  int httpResponseCode = null;
  MixList();

  @override
  String toString() {
    return 'MixList[mixes=$mixes, success=$success, message=$message, httpResponseCode=$httpResponseCode, ]';
  }

  MixList.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    mixes = Mix.listFromJson(json['Mixes']);
    success = json['Success'];
    message = json['Message'];
    httpResponseCode = json['HttpResponseCode'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Mixes': mixes,
      'Success': success,
      'Message': message,
      'HttpResponseCode': httpResponseCode
    };
  }

  static List<MixList> listFromJson(List<dynamic> json) {
    return json == null ? new List<MixList>() : json.map((value) => new MixList.fromJson(value)).toList();
  }

  static Map<String, MixList> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, MixList>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new MixList.fromJson(value));
    }
    return map;
  }
}


part of openapi.api;

class SmartHookahModelsDbPuf {
  
  String sId = null;
  
  int T = null;
  //enum TEnum {  0,  1,  2,  };{
  
  DateTime D = null;
  
  int M = null;
  
  int P = null;
  SmartHookahModelsDbPuf();

  @override
  String toString() {
    return 'SmartHookahModelsDbPuf[sId=$sId, T=$T, D=$D, M=$M, P=$P, ]';
  }

  SmartHookahModelsDbPuf.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    sId = json['SId'];
    T = json['T'];
    D = json['D'] == null ? null : DateTime.parse(json['D']);
    M = json['M'];
    P = json['P'];
  }

  Map<String, dynamic> toJson() {
    return {
      'SId': sId,
      'T': T,
      'D': D == null ? '' : D.toUtc().toIso8601String(),
      'M': M,
      'P': P
    };
  }

  static List<SmartHookahModelsDbPuf> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahModelsDbPuf>() : json.map((value) => new SmartHookahModelsDbPuf.fromJson(value)).toList();
  }

  static Map<String, SmartHookahModelsDbPuf> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahModelsDbPuf>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahModelsDbPuf.fromJson(value));
    }
    return map;
  }
}


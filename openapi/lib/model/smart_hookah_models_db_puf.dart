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
    if (json['SId'] == null) {
      sId = null;
    } else {
          sId = json['SId'];
    }
    if (json['T'] == null) {
      T = null;
    } else {
          T = json['T'];
    }
    if (json['D'] == null) {
      D = null;
    } else {
      D = DateTime.parse(json['D']);
    }
    if (json['M'] == null) {
      M = null;
    } else {
          M = json['M'];
    }
    if (json['P'] == null) {
      P = null;
    } else {
          P = json['P'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (sId != null)
      json['SId'] = sId;
    if (T != null)
      json['T'] = T;
    if (D != null)
      json['D'] = D == null ? null : D.toUtc().toIso8601String();
    if (M != null)
      json['M'] = M;
    if (P != null)
      json['P'] = P;
    return json;
  }

  static List<SmartHookahModelsDbPuf> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahModelsDbPuf>() : json.map((value) => new SmartHookahModelsDbPuf.fromJson(value)).toList();
  }

  static Map<String, SmartHookahModelsDbPuf> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahModelsDbPuf>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahModelsDbPuf.fromJson(value));
    }
    return map;
  }
}


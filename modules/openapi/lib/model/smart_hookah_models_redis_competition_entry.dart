part of openapi.api;

class SmartHookahModelsRedisCompetitionEntry {
  
  String name = null;
  
  double time = null;
  SmartHookahModelsRedisCompetitionEntry();

  @override
  String toString() {
    return 'SmartHookahModelsRedisCompetitionEntry[name=$name, time=$time, ]';
  }

  SmartHookahModelsRedisCompetitionEntry.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Name'] == null) {
      name = null;
    } else {
          name = json['Name'];
    }
    if (json['Time'] == null) {
      time = null;
    } else {
          time = json['Time'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (name != null)
      json['Name'] = name;
    if (time != null)
      json['Time'] = time;
    return json;
  }

  static List<SmartHookahModelsRedisCompetitionEntry> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahModelsRedisCompetitionEntry>() : json.map((value) => new SmartHookahModelsRedisCompetitionEntry.fromJson(value)).toList();
  }

  static Map<String, SmartHookahModelsRedisCompetitionEntry> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahModelsRedisCompetitionEntry>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahModelsRedisCompetitionEntry.fromJson(value));
    }
    return map;
  }
}


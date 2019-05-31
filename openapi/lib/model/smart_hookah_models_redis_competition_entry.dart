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
    name = json['Name'];
    time = json['Time'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Time': time
    };
  }

  static List<SmartHookahModelsRedisCompetitionEntry> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahModelsRedisCompetitionEntry>() : json.map((value) => new SmartHookahModelsRedisCompetitionEntry.fromJson(value)).toList();
  }

  static Map<String, SmartHookahModelsRedisCompetitionEntry> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahModelsRedisCompetitionEntry>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahModelsRedisCompetitionEntry.fromJson(value));
    }
    return map;
  }
}


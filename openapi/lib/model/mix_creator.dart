part of openapi.api;

class MixCreator {
  
  String name = null;
  
  String displayName = null;
  
  String picture = null;
  
  int mixCount = null;
  MixCreator();

  @override
  String toString() {
    return 'MixCreator[name=$name, displayName=$displayName, picture=$picture, mixCount=$mixCount, ]';
  }

  MixCreator.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['Name'];
    displayName = json['DisplayName'];
    picture = json['Picture'];
    mixCount = json['MixCount'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'DisplayName': displayName,
      'Picture': picture,
      'MixCount': mixCount
    };
  }

  static List<MixCreator> listFromJson(List<dynamic> json) {
    return json == null ? new List<MixCreator>() : json.map((value) => new MixCreator.fromJson(value)).toList();
  }

  static Map<String, MixCreator> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, MixCreator>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new MixCreator.fromJson(value));
    }
    return map;
  }
}


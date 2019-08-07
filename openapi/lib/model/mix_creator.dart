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
    if (json['Name'] == null) {
      name = null;
    } else {
          name = json['Name'];
    }
    if (json['DisplayName'] == null) {
      displayName = null;
    } else {
          displayName = json['DisplayName'];
    }
    if (json['Picture'] == null) {
      picture = null;
    } else {
          picture = json['Picture'];
    }
    if (json['MixCount'] == null) {
      mixCount = null;
    } else {
          mixCount = json['MixCount'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (name != null)
      json['Name'] = name;
    if (displayName != null)
      json['DisplayName'] = displayName;
    if (picture != null)
      json['Picture'] = picture;
    if (mixCount != null)
      json['MixCount'] = mixCount;
    return json;
  }

  static List<MixCreator> listFromJson(List<dynamic> json) {
    return json == null ? new List<MixCreator>() : json.map((value) => new MixCreator.fromJson(value)).toList();
  }

  static Map<String, MixCreator> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, MixCreator>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new MixCreator.fromJson(value));
    }
    return map;
  }
}


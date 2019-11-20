part of openapi.api;

class SearchPipeAccessory {
  
  int id = null;
  
  String name = null;
  
  String brand = null;
  
  String type = null;
  
  bool nonVerified = null;
  SearchPipeAccessory();

  @override
  String toString() {
    return 'SearchPipeAccessory[id=$id, name=$name, brand=$brand, type=$type, nonVerified=$nonVerified, ]';
  }

  SearchPipeAccessory.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
    if (json['Name'] == null) {
      name = null;
    } else {
          name = json['Name'];
    }
    if (json['Brand'] == null) {
      brand = null;
    } else {
          brand = json['Brand'];
    }
    if (json['Type'] == null) {
      type = null;
    } else {
          type = json['Type'];
    }
    if (json['NonVerified'] == null) {
      nonVerified = null;
    } else {
          nonVerified = json['NonVerified'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['Id'] = id;
    if (name != null)
      json['Name'] = name;
    if (brand != null)
      json['Brand'] = brand;
    if (type != null)
      json['Type'] = type;
    if (nonVerified != null)
      json['NonVerified'] = nonVerified;
    return json;
  }

  static List<SearchPipeAccessory> listFromJson(List<dynamic> json) {
    return json == null ? new List<SearchPipeAccessory>() : json.map((value) => new SearchPipeAccessory.fromJson(value)).toList();
  }

  static Map<String, SearchPipeAccessory> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SearchPipeAccessory>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new SearchPipeAccessory.fromJson(value));
    }
    return map;
  }
}


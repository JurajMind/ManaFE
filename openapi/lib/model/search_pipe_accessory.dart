part of openapi.api;

class SearchPipeAccessory {
  
  int id = null;
  
  String name = null;
  
  String brand = null;
  
  String type = null;
  SearchPipeAccessory();

  @override
  String toString() {
    return 'SearchPipeAccessory[id=$id, name=$name, brand=$brand, type=$type, ]';
  }

  SearchPipeAccessory.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['Id'];
    name = json['Name'];
    brand = json['Brand'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Brand': brand,
      'Type': type
    };
  }

  static List<SearchPipeAccessory> listFromJson(List<dynamic> json) {
    return json == null ? new List<SearchPipeAccessory>() : json.map((value) => new SearchPipeAccessory.fromJson(value)).toList();
  }

  static Map<String, SearchPipeAccessory> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SearchPipeAccessory>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new SearchPipeAccessory.fromJson(value));
    }
    return map;
  }
}


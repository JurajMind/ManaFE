part of openapi.api;

class GearServiceSearchPipeAccesory {
  
  int id = null;
  
  String name = null;
  
  String brand = null;
  
  String type = null;
  
  int owned = null;
  GearServiceSearchPipeAccesory();

  @override
  String toString() {
    return 'GearServiceSearchPipeAccesory[id=$id, name=$name, brand=$brand, type=$type, owned=$owned, ]';
  }

  GearServiceSearchPipeAccesory.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['Id'];
    name = json['Name'];
    brand = json['Brand'];
    type = json['Type'];
    owned = json['Owned'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Brand': brand,
      'Type': type,
      'Owned': owned
    };
  }

  static List<GearServiceSearchPipeAccesory> listFromJson(List<dynamic> json) {
    return json == null ? new List<GearServiceSearchPipeAccesory>() : json.map((value) => new GearServiceSearchPipeAccesory.fromJson(value)).toList();
  }

  static Map<String, GearServiceSearchPipeAccesory> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, GearServiceSearchPipeAccesory>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new GearServiceSearchPipeAccesory.fromJson(value));
    }
    return map;
  }
}


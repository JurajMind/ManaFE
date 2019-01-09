part of openapi.api;

class FranchiseDto {
  
  int id = null;
  
  String name = null;
  
  String uril = null;
  FranchiseDto();

  @override
  String toString() {
    return 'FranchiseDto[id=$id, name=$name, uril=$uril, ]';
  }

  FranchiseDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['Id'];
    name = json['Name'];
    uril = json['Uril'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Uril': uril
    };
  }

  static List<FranchiseDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<FranchiseDto>() : json.map((value) => new FranchiseDto.fromJson(value)).toList();
  }

  static Map<String, FranchiseDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, FranchiseDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new FranchiseDto.fromJson(value));
    }
    return map;
  }
}


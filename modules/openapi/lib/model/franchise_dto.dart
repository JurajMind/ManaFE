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
    if (json['Uril'] == null) {
      uril = null;
    } else {
          uril = json['Uril'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['Id'] = id;
    if (name != null)
      json['Name'] = name;
    if (uril != null)
      json['Uril'] = uril;
    return json;
  }

  static List<FranchiseDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<FranchiseDto>() : json.map((value) => new FranchiseDto.fromJson(value)).toList();
  }

  static Map<String, FranchiseDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, FranchiseDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new FranchiseDto.fromJson(value));
    }
    return map;
  }
}


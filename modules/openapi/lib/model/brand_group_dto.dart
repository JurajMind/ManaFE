part of openapi.api;

class BrandGroupDto {
  
  String id = null;
  
  String picture = null;
  
  String name = null;
  
  int itemCount = null;
  BrandGroupDto();

  @override
  String toString() {
    return 'BrandGroupDto[id=$id, picture=$picture, name=$name, itemCount=$itemCount, ]';
  }

  BrandGroupDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
    if (json['Picture'] == null) {
      picture = null;
    } else {
          picture = json['Picture'];
    }
    if (json['Name'] == null) {
      name = null;
    } else {
          name = json['Name'];
    }
    if (json['ItemCount'] == null) {
      itemCount = null;
    } else {
          itemCount = json['ItemCount'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['Id'] = id;
    if (picture != null)
      json['Picture'] = picture;
    if (name != null)
      json['Name'] = name;
    if (itemCount != null)
      json['ItemCount'] = itemCount;
    return json;
  }

  static List<BrandGroupDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<BrandGroupDto>() : json.map((value) => new BrandGroupDto.fromJson(value)).toList();
  }

  static Map<String, BrandGroupDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, BrandGroupDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new BrandGroupDto.fromJson(value));
    }
    return map;
  }
}


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
    id = json['Id'];
    picture = json['Picture'];
    name = json['Name'];
    itemCount = json['ItemCount'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Picture': picture,
      'Name': name,
      'ItemCount': itemCount
    };
  }

  static List<BrandGroupDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<BrandGroupDto>() : json.map((value) => new BrandGroupDto.fromJson(value)).toList();
  }

  static Map<String, BrandGroupDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, BrandGroupDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new BrandGroupDto.fromJson(value));
    }
    return map;
  }
}


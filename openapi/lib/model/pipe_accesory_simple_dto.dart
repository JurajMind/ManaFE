part of openapi.api;

class PipeAccesorySimpleDto {
  
  List<PipeAccesoryLikeDto> likes = [];
  
  int id = null;
  
  String name = null;
  
  String brand = null;
  
  String brandId = null;
  
  String picture = null;
  
  String type = null;
  
  int likeCount = null;
  
  int disLikeCount = null;
  PipeAccesorySimpleDto();

  @override
  String toString() {
    return 'PipeAccesorySimpleDto[likes=$likes, id=$id, name=$name, brand=$brand, brandId=$brandId, picture=$picture, type=$type, likeCount=$likeCount, disLikeCount=$disLikeCount, ]';
  }

  PipeAccesorySimpleDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    likes = PipeAccesoryLikeDto.listFromJson(json['Likes']);
    id = json['Id'];
    name = json['Name'];
    brand = json['Brand'];
    brandId = json['BrandId'];
    picture = json['Picture'];
    type = json['Type'];
    likeCount = json['LikeCount'];
    disLikeCount = json['DisLikeCount'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Likes': likes,
      'Id': id,
      'Name': name,
      'Brand': brand,
      'BrandId': brandId,
      'Picture': picture,
      'Type': type,
      'LikeCount': likeCount,
      'DisLikeCount': disLikeCount
    };
  }

  static List<PipeAccesorySimpleDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PipeAccesorySimpleDto>() : json.map((value) => new PipeAccesorySimpleDto.fromJson(value)).toList();
  }

  static Map<String, PipeAccesorySimpleDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PipeAccesorySimpleDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new PipeAccesorySimpleDto.fromJson(value));
    }
    return map;
  }
}


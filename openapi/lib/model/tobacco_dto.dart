part of openapi.api;

class TobaccoDto {
  
  List<PipeAccesoryLikeDto> likes = [];
  
  int used = null;
  
  int id = null;
  
  String name = null;
  
  String brand = null;
  
  String brandId = null;
  
  String picture = null;
  
  String type = null;
  
  int likeCount = null;
  
  int disLikeCount = null;
  TobaccoDto();

  @override
  String toString() {
    return 'TobaccoDto[likes=$likes, used=$used, id=$id, name=$name, brand=$brand, brandId=$brandId, picture=$picture, type=$type, likeCount=$likeCount, disLikeCount=$disLikeCount, ]';
  }

  TobaccoDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    likes = PipeAccesoryLikeDto.listFromJson(json['Likes']);
    used = json['Used'];
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
      'Used': used,
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

  static List<TobaccoDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<TobaccoDto>() : json.map((value) => new TobaccoDto.fromJson(value)).toList();
  }

  static Map<String, TobaccoDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, TobaccoDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new TobaccoDto.fromJson(value));
    }
    return map;
  }
}


part of openapi.api;

class TobaccoMixSimpleDto {
  
  List<PipeAccesoryLikeDto> likes = [];
  
  List<TobaccoInMix> tobaccos = [];
  
  bool myMix = null;
  
  int id = null;
  
  String name = null;
  
  String brand = null;
  
  String brandId = null;
  
  String picture = null;
  
  String type = null;
  
  int likeCount = null;
  
  int disLikeCount = null;
  TobaccoMixSimpleDto();

  @override
  String toString() {
    return 'TobaccoMixSimpleDto[likes=$likes, tobaccos=$tobaccos, myMix=$myMix, id=$id, name=$name, brand=$brand, brandId=$brandId, picture=$picture, type=$type, likeCount=$likeCount, disLikeCount=$disLikeCount, ]';
  }

  TobaccoMixSimpleDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    likes = PipeAccesoryLikeDto.listFromJson(json['Likes']);
    tobaccos = TobaccoInMix.listFromJson(json['Tobaccos']);
    myMix = json['MyMix'];
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
      'Tobaccos': tobaccos,
      'MyMix': myMix,
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

  static List<TobaccoMixSimpleDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<TobaccoMixSimpleDto>() : json.map((value) => new TobaccoMixSimpleDto.fromJson(value)).toList();
  }

  static Map<String, TobaccoMixSimpleDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, TobaccoMixSimpleDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new TobaccoMixSimpleDto.fromJson(value));
    }
    return map;
  }
}


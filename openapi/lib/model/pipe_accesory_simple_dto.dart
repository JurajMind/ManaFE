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
    if (json['Likes'] == null) {
      likes = null;
    } else {
      likes = PipeAccesoryLikeDto.listFromJson(json['Likes']);
    }
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
    if (json['BrandId'] == null) {
      brandId = null;
    } else {
          brandId = json['BrandId'];
    }
    if (json['Picture'] == null) {
      picture = null;
    } else {
          picture = json['Picture'];
    }
    if (json['Type'] == null) {
      type = null;
    } else {
          type = json['Type'];
    }
    if (json['LikeCount'] == null) {
      likeCount = null;
    } else {
          likeCount = json['LikeCount'];
    }
    if (json['DisLikeCount'] == null) {
      disLikeCount = null;
    } else {
          disLikeCount = json['DisLikeCount'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (likes != null)
      json['Likes'] = likes;
    if (id != null)
      json['Id'] = id;
    if (name != null)
      json['Name'] = name;
    if (brand != null)
      json['Brand'] = brand;
    if (brandId != null)
      json['BrandId'] = brandId;
    if (picture != null)
      json['Picture'] = picture;
    if (type != null)
      json['Type'] = type;
    if (likeCount != null)
      json['LikeCount'] = likeCount;
    if (disLikeCount != null)
      json['DisLikeCount'] = disLikeCount;
    return json;
  }

  static List<PipeAccesorySimpleDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PipeAccesorySimpleDto>() : json.map((value) => new PipeAccesorySimpleDto.fromJson(value)).toList();
  }

  static Map<String, PipeAccesorySimpleDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PipeAccesorySimpleDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new PipeAccesorySimpleDto.fromJson(value));
    }
    return map;
  }
}


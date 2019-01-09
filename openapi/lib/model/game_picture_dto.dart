part of openapi.api;

class GamePictureDto {
  
  String pictureUrl = null;
  GamePictureDto();

  @override
  String toString() {
    return 'GamePictureDto[pictureUrl=$pictureUrl, ]';
  }

  GamePictureDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    pictureUrl = json['PictureUrl'];
  }

  Map<String, dynamic> toJson() {
    return {
      'PictureUrl': pictureUrl
    };
  }

  static List<GamePictureDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<GamePictureDto>() : json.map((value) => new GamePictureDto.fromJson(value)).toList();
  }

  static Map<String, GamePictureDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, GamePictureDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new GamePictureDto.fromJson(value));
    }
    return map;
  }
}


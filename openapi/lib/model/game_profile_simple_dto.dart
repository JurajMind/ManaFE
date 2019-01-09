part of openapi.api;

class GameProfileSimpleDto {
  
  int personId = null;
  
  int level = null;
  
  int testLevel = null;
  
  double lvlProgress = null;
  
  int experience = null;
  
  int clouds = null;
  
  GamePictureDto picture = null;
  GameProfileSimpleDto();

  @override
  String toString() {
    return 'GameProfileSimpleDto[personId=$personId, level=$level, testLevel=$testLevel, lvlProgress=$lvlProgress, experience=$experience, clouds=$clouds, picture=$picture, ]';
  }

  GameProfileSimpleDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    personId = json['PersonId'];
    level = json['Level'];
    testLevel = json['TestLevel'];
    lvlProgress = json['LvlProgress'];
    experience = json['Experience'];
    clouds = json['Clouds'];
    picture = new GamePictureDto.fromJson(json['Picture']);
  }

  Map<String, dynamic> toJson() {
    return {
      'PersonId': personId,
      'Level': level,
      'TestLevel': testLevel,
      'LvlProgress': lvlProgress,
      'Experience': experience,
      'Clouds': clouds,
      'Picture': picture
    };
  }

  static List<GameProfileSimpleDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<GameProfileSimpleDto>() : json.map((value) => new GameProfileSimpleDto.fromJson(value)).toList();
  }

  static Map<String, GameProfileSimpleDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, GameProfileSimpleDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new GameProfileSimpleDto.fromJson(value));
    }
    return map;
  }
}


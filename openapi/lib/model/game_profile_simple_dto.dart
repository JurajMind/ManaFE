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
    if (json['PersonId'] == null) {
      personId = null;
    } else {
          personId = json['PersonId'];
    }
    if (json['Level'] == null) {
      level = null;
    } else {
          level = json['Level'];
    }
    if (json['TestLevel'] == null) {
      testLevel = null;
    } else {
          testLevel = json['TestLevel'];
    }
    if (json['LvlProgress'] == null) {
      lvlProgress = null;
    } else {
          lvlProgress = json['LvlProgress'];
    }
    if (json['Experience'] == null) {
      experience = null;
    } else {
          experience = json['Experience'];
    }
    if (json['Clouds'] == null) {
      clouds = null;
    } else {
          clouds = json['Clouds'];
    }
    if (json['Picture'] == null) {
      picture = null;
    } else {
      picture = new GamePictureDto.fromJson(json['Picture']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (personId != null)
      json['PersonId'] = personId;
    if (level != null)
      json['Level'] = level;
    if (testLevel != null)
      json['TestLevel'] = testLevel;
    if (lvlProgress != null)
      json['LvlProgress'] = lvlProgress;
    if (experience != null)
      json['Experience'] = experience;
    if (clouds != null)
      json['Clouds'] = clouds;
    if (picture != null)
      json['Picture'] = picture;
    return json;
  }

  static List<GameProfileSimpleDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<GameProfileSimpleDto>() : json.map((value) => new GameProfileSimpleDto.fromJson(value)).toList();
  }

  static Map<String, GameProfileSimpleDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, GameProfileSimpleDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new GameProfileSimpleDto.fromJson(value));
    }
    return map;
  }
}


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GameProfileSimpleDto {
  /// Returns a new [GameProfileSimpleDto] instance.
  GameProfileSimpleDto({
    this.personId,
    this.level,
    this.testLevel,
    this.lvlProgress,
    this.experience,
    this.clouds,
    this.picture,
  });

  int personId;

  int level;

  int testLevel;

  double lvlProgress;

  int experience;

  int clouds;

  GamePictureDto picture;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GameProfileSimpleDto &&
     other.personId == personId &&
     other.level == level &&
     other.testLevel == testLevel &&
     other.lvlProgress == lvlProgress &&
     other.experience == experience &&
     other.clouds == clouds &&
     other.picture == picture;

  @override
  int get hashCode =>
    (personId == null ? 0 : personId.hashCode) +
    (level == null ? 0 : level.hashCode) +
    (testLevel == null ? 0 : testLevel.hashCode) +
    (lvlProgress == null ? 0 : lvlProgress.hashCode) +
    (experience == null ? 0 : experience.hashCode) +
    (clouds == null ? 0 : clouds.hashCode) +
    (picture == null ? 0 : picture.hashCode);

  @override
  String toString() => 'GameProfileSimpleDto[personId=$personId, level=$level, testLevel=$testLevel, lvlProgress=$lvlProgress, experience=$experience, clouds=$clouds, picture=$picture]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (personId != null) {
      json[r'PersonId'] = personId;
    }
    if (level != null) {
      json[r'Level'] = level;
    }
    if (testLevel != null) {
      json[r'TestLevel'] = testLevel;
    }
    if (lvlProgress != null) {
      json[r'LvlProgress'] = lvlProgress;
    }
    if (experience != null) {
      json[r'Experience'] = experience;
    }
    if (clouds != null) {
      json[r'Clouds'] = clouds;
    }
    if (picture != null) {
      json[r'Picture'] = picture;
    }
    return json;
  }

  /// Returns a new [GameProfileSimpleDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static GameProfileSimpleDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : GameProfileSimpleDto(
        personId: json[r'PersonId'],
        level: json[r'Level'],
        testLevel: json[r'TestLevel'],
        lvlProgress: json[r'LvlProgress'],
        experience: json[r'Experience'],
        clouds: json[r'Clouds'],
        picture: GamePictureDto.fromJson(json[r'Picture']),
    );

  static List<GameProfileSimpleDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <GameProfileSimpleDto>[]
      : json.map((v) => GameProfileSimpleDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, GameProfileSimpleDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, GameProfileSimpleDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = GameProfileSimpleDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of GameProfileSimpleDto-objects as value to a dart map
  static Map<String, List<GameProfileSimpleDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<GameProfileSimpleDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = GameProfileSimpleDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


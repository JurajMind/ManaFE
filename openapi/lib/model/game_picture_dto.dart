//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GamePictureDto {
  /// Returns a new [GamePictureDto] instance.
  GamePictureDto({
    this.pictureUrl,
  });

  String pictureUrl;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GamePictureDto &&
     other.pictureUrl == pictureUrl;

  @override
  int get hashCode =>
    (pictureUrl == null ? 0 : pictureUrl.hashCode);

  @override
  String toString() => 'GamePictureDto[pictureUrl=$pictureUrl]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (pictureUrl != null) {
      json[r'PictureUrl'] = pictureUrl;
    }
    return json;
  }

  /// Returns a new [GamePictureDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static GamePictureDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : GamePictureDto(
        pictureUrl: json[r'PictureUrl'],
    );

  static List<GamePictureDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <GamePictureDto>[]
      : json.map((v) => GamePictureDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, GamePictureDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, GamePictureDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = GamePictureDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of GamePictureDto-objects as value to a dart map
  static Map<String, List<GamePictureDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<GamePictureDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = GamePictureDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TobaccoTasteDto {
  /// Returns a new [TobaccoTasteDto] instance.
  TobaccoTasteDto({
    this.czName,
    this.engName,
    this.id,
    this.originalName,
  });

  String czName;

  String engName;

  int id;

  String originalName;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TobaccoTasteDto &&
     other.czName == czName &&
     other.engName == engName &&
     other.id == id &&
     other.originalName == originalName;

  @override
  int get hashCode =>
    (czName == null ? 0 : czName.hashCode) +
    (engName == null ? 0 : engName.hashCode) +
    (id == null ? 0 : id.hashCode) +
    (originalName == null ? 0 : originalName.hashCode);

  @override
  String toString() => 'TobaccoTasteDto[czName=$czName, engName=$engName, id=$id, originalName=$originalName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (czName != null) {
      json[r'CzName'] = czName;
    }
    if (engName != null) {
      json[r'EngName'] = engName;
    }
    if (id != null) {
      json[r'Id'] = id;
    }
    if (originalName != null) {
      json[r'OriginalName'] = originalName;
    }
    return json;
  }

  /// Returns a new [TobaccoTasteDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static TobaccoTasteDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : TobaccoTasteDto(
        czName: json[r'CzName'],
        engName: json[r'EngName'],
        id: json[r'Id'],
        originalName: json[r'OriginalName'],
    );

  static List<TobaccoTasteDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <TobaccoTasteDto>[]
      : json.map((v) => TobaccoTasteDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, TobaccoTasteDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, TobaccoTasteDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = TobaccoTasteDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of TobaccoTasteDto-objects as value to a dart map
  static Map<String, List<TobaccoTasteDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<TobaccoTasteDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = TobaccoTasteDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


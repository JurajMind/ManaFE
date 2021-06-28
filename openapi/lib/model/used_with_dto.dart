//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UsedWithDto {
  /// Returns a new [UsedWithDto] instance.
  UsedWithDto({
    this.accessory,
    this.usedCount,
  });

  PipeAccesorySimpleDto accessory;

  int usedCount;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UsedWithDto &&
     other.accessory == accessory &&
     other.usedCount == usedCount;

  @override
  int get hashCode =>
    (accessory == null ? 0 : accessory.hashCode) +
    (usedCount == null ? 0 : usedCount.hashCode);

  @override
  String toString() => 'UsedWithDto[accessory=$accessory, usedCount=$usedCount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (accessory != null) {
      json[r'Accessory'] = accessory;
    }
    if (usedCount != null) {
      json[r'UsedCount'] = usedCount;
    }
    return json;
  }

  /// Returns a new [UsedWithDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static UsedWithDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : UsedWithDto(
        accessory: PipeAccesorySimpleDto.fromJson(json[r'Accessory']),
        usedCount: json[r'UsedCount'],
    );

  static List<UsedWithDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <UsedWithDto>[]
      : json.map((v) => UsedWithDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, UsedWithDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, UsedWithDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = UsedWithDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of UsedWithDto-objects as value to a dart map
  static Map<String, List<UsedWithDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<UsedWithDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = UsedWithDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


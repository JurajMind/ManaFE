//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PlaceCalendarDto {
  /// Returns a new [PlaceCalendarDto] instance.
  PlaceCalendarDto({
    this.placeDays = const [],
  });

  List<PlaceDay> placeDays;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PlaceCalendarDto &&
     other.placeDays == placeDays;

  @override
  int get hashCode =>
    (placeDays == null ? 0 : placeDays.hashCode);

  @override
  String toString() => 'PlaceCalendarDto[placeDays=$placeDays]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (placeDays != null) {
      json[r'PlaceDays'] = placeDays;
    }
    return json;
  }

  /// Returns a new [PlaceCalendarDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static PlaceCalendarDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : PlaceCalendarDto(
        placeDays: PlaceDay.listFromJson(json[r'PlaceDays']),
    );

  static List<PlaceCalendarDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <PlaceCalendarDto>[]
      : json.map((v) => PlaceCalendarDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, PlaceCalendarDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, PlaceCalendarDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = PlaceCalendarDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of PlaceCalendarDto-objects as value to a dart map
  static Map<String, List<PlaceCalendarDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<PlaceCalendarDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = PlaceCalendarDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


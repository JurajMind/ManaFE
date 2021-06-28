//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BusinessHoursDto {
  /// Returns a new [BusinessHoursDto] instance.
  BusinessHoursDto({
    this.id,
    this.placeId,
    this.day,
    this.openTine,
    this.closeTime,
  });

  int id;

  int placeId;

  int day;

  String openTine;

  String closeTime;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BusinessHoursDto &&
     other.id == id &&
     other.placeId == placeId &&
     other.day == day &&
     other.openTine == openTine &&
     other.closeTime == closeTime;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (placeId == null ? 0 : placeId.hashCode) +
    (day == null ? 0 : day.hashCode) +
    (openTine == null ? 0 : openTine.hashCode) +
    (closeTime == null ? 0 : closeTime.hashCode);

  @override
  String toString() => 'BusinessHoursDto[id=$id, placeId=$placeId, day=$day, openTine=$openTine, closeTime=$closeTime]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'Id'] = id;
    }
    if (placeId != null) {
      json[r'PlaceId'] = placeId;
    }
    if (day != null) {
      json[r'Day'] = day;
    }
    if (openTine != null) {
      json[r'OpenTine'] = openTine;
    }
    if (closeTime != null) {
      json[r'CloseTime'] = closeTime;
    }
    return json;
  }

  /// Returns a new [BusinessHoursDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static BusinessHoursDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : BusinessHoursDto(
        id: json[r'Id'],
        placeId: json[r'PlaceId'],
        day: json[r'Day'],
        openTine: json[r'OpenTine'],
        closeTime: json[r'CloseTime'],
    );

  static List<BusinessHoursDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <BusinessHoursDto>[]
      : json.map((v) => BusinessHoursDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, BusinessHoursDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, BusinessHoursDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = BusinessHoursDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of BusinessHoursDto-objects as value to a dart map
  static Map<String, List<BusinessHoursDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<BusinessHoursDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = BusinessHoursDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


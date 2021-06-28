//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SmokeSessionStatisticsDto {
  /// Returns a new [SmokeSessionStatisticsDto] instance.
  SmokeSessionStatisticsDto({
    this.id,
    this.start,
    this.end,
    this.smokeDuration,
    this.longestPuf,
    this.pufCount,
    this.estimatedPersonCount,
    this.sessionDuration,
  });

  int id;

  DateTime start;

  DateTime end;

  String smokeDuration;

  String longestPuf;

  int pufCount;

  int estimatedPersonCount;

  String sessionDuration;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SmokeSessionStatisticsDto &&
     other.id == id &&
     other.start == start &&
     other.end == end &&
     other.smokeDuration == smokeDuration &&
     other.longestPuf == longestPuf &&
     other.pufCount == pufCount &&
     other.estimatedPersonCount == estimatedPersonCount &&
     other.sessionDuration == sessionDuration;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (start == null ? 0 : start.hashCode) +
    (end == null ? 0 : end.hashCode) +
    (smokeDuration == null ? 0 : smokeDuration.hashCode) +
    (longestPuf == null ? 0 : longestPuf.hashCode) +
    (pufCount == null ? 0 : pufCount.hashCode) +
    (estimatedPersonCount == null ? 0 : estimatedPersonCount.hashCode) +
    (sessionDuration == null ? 0 : sessionDuration.hashCode);

  @override
  String toString() => 'SmokeSessionStatisticsDto[id=$id, start=$start, end=$end, smokeDuration=$smokeDuration, longestPuf=$longestPuf, pufCount=$pufCount, estimatedPersonCount=$estimatedPersonCount, sessionDuration=$sessionDuration]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'id'] = id;
    }
    if (start != null) {
      json[r'start'] = start.toUtc().toIso8601String();
    }
    if (end != null) {
      json[r'end'] = end.toUtc().toIso8601String();
    }
    if (smokeDuration != null) {
      json[r'smokeDuration'] = smokeDuration;
    }
    if (longestPuf != null) {
      json[r'longestPuf'] = longestPuf;
    }
    if (pufCount != null) {
      json[r'pufCount'] = pufCount;
    }
    if (estimatedPersonCount != null) {
      json[r'estimatedPersonCount'] = estimatedPersonCount;
    }
    if (sessionDuration != null) {
      json[r'sessionDuration'] = sessionDuration;
    }
    return json;
  }

  /// Returns a new [SmokeSessionStatisticsDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static SmokeSessionStatisticsDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : SmokeSessionStatisticsDto(
        id: json[r'id'],
        start: json[r'start'] == null
          ? null
          : DateTime.parse(json[r'start']),
        end: json[r'end'] == null
          ? null
          : DateTime.parse(json[r'end']),
        smokeDuration: json[r'smokeDuration'],
        longestPuf: json[r'longestPuf'],
        pufCount: json[r'pufCount'],
        estimatedPersonCount: json[r'estimatedPersonCount'],
        sessionDuration: json[r'sessionDuration'],
    );

  static List<SmokeSessionStatisticsDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmokeSessionStatisticsDto>[]
      : json.map((v) => SmokeSessionStatisticsDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, SmokeSessionStatisticsDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, SmokeSessionStatisticsDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = SmokeSessionStatisticsDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of SmokeSessionStatisticsDto-objects as value to a dart map
  static Map<String, List<SmokeSessionStatisticsDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<SmokeSessionStatisticsDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = SmokeSessionStatisticsDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


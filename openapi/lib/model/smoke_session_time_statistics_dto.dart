//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SmokeSessionTimeStatisticsDto {
  /// Returns a new [SmokeSessionTimeStatisticsDto] instance.
  SmokeSessionTimeStatisticsDto({
    this.sessionsCount,
    this.sessionsDuration,
    this.smokeDuration,
    this.puffCount,
    this.dayOfWeekDistribution = const {},
    this.sessionStartTimeDistribution = const {},
  });

  int sessionsCount;

  String sessionsDuration;

  String smokeDuration;

  int puffCount;

  Map<String, int> dayOfWeekDistribution;

  Map<String, int> sessionStartTimeDistribution;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SmokeSessionTimeStatisticsDto &&
     other.sessionsCount == sessionsCount &&
     other.sessionsDuration == sessionsDuration &&
     other.smokeDuration == smokeDuration &&
     other.puffCount == puffCount &&
     other.dayOfWeekDistribution == dayOfWeekDistribution &&
     other.sessionStartTimeDistribution == sessionStartTimeDistribution;

  @override
  int get hashCode =>
    (sessionsCount == null ? 0 : sessionsCount.hashCode) +
    (sessionsDuration == null ? 0 : sessionsDuration.hashCode) +
    (smokeDuration == null ? 0 : smokeDuration.hashCode) +
    (puffCount == null ? 0 : puffCount.hashCode) +
    (dayOfWeekDistribution == null ? 0 : dayOfWeekDistribution.hashCode) +
    (sessionStartTimeDistribution == null ? 0 : sessionStartTimeDistribution.hashCode);

  @override
  String toString() => 'SmokeSessionTimeStatisticsDto[sessionsCount=$sessionsCount, sessionsDuration=$sessionsDuration, smokeDuration=$smokeDuration, puffCount=$puffCount, dayOfWeekDistribution=$dayOfWeekDistribution, sessionStartTimeDistribution=$sessionStartTimeDistribution]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (sessionsCount != null) {
      json[r'SessionsCount'] = sessionsCount;
    }
    if (sessionsDuration != null) {
      json[r'SessionsDuration'] = sessionsDuration;
    }
    if (smokeDuration != null) {
      json[r'SmokeDuration'] = smokeDuration;
    }
    if (puffCount != null) {
      json[r'PuffCount'] = puffCount;
    }
    if (dayOfWeekDistribution != null) {
      json[r'DayOfWeekDistribution'] = dayOfWeekDistribution;
    }
    if (sessionStartTimeDistribution != null) {
      json[r'SessionStartTimeDistribution'] = sessionStartTimeDistribution;
    }
    return json;
  }

  /// Returns a new [SmokeSessionTimeStatisticsDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static SmokeSessionTimeStatisticsDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : SmokeSessionTimeStatisticsDto(
        sessionsCount: json[r'SessionsCount'],
        sessionsDuration: json[r'SessionsDuration'],
        smokeDuration: json[r'SmokeDuration'],
        puffCount: json[r'PuffCount'],
        dayOfWeekDistribution: json[r'DayOfWeekDistribution'] == null ?
          null :
          (json[r'DayOfWeekDistribution'] as Map).cast<String, int>(),
        sessionStartTimeDistribution: json[r'SessionStartTimeDistribution'] == null ?
          null :
          (json[r'SessionStartTimeDistribution'] as Map).cast<String, int>(),
    );

  static List<SmokeSessionTimeStatisticsDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmokeSessionTimeStatisticsDto>[]
      : json.map((v) => SmokeSessionTimeStatisticsDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, SmokeSessionTimeStatisticsDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, SmokeSessionTimeStatisticsDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = SmokeSessionTimeStatisticsDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of SmokeSessionTimeStatisticsDto-objects as value to a dart map
  static Map<String, List<SmokeSessionTimeStatisticsDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<SmokeSessionTimeStatisticsDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = SmokeSessionTimeStatisticsDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


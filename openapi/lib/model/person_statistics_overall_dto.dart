//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PersonStatisticsOverallDto {
  /// Returns a new [PersonStatisticsOverallDto] instance.
  PersonStatisticsOverallDto({
    this.timeStatistics,
    this.accessoriesUsage = const [],
    this.smokeSessions = const [],
  });

  SmokeSessionTimeStatisticsDto timeStatistics;

  List<PipeAccessoryUsageDto> accessoriesUsage;

  List<SmokeSessionSimpleDto> smokeSessions;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PersonStatisticsOverallDto &&
     other.timeStatistics == timeStatistics &&
     other.accessoriesUsage == accessoriesUsage &&
     other.smokeSessions == smokeSessions;

  @override
  int get hashCode =>
    (timeStatistics == null ? 0 : timeStatistics.hashCode) +
    (accessoriesUsage == null ? 0 : accessoriesUsage.hashCode) +
    (smokeSessions == null ? 0 : smokeSessions.hashCode);

  @override
  String toString() => 'PersonStatisticsOverallDto[timeStatistics=$timeStatistics, accessoriesUsage=$accessoriesUsage, smokeSessions=$smokeSessions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (timeStatistics != null) {
      json[r'TimeStatistics'] = timeStatistics;
    }
    if (accessoriesUsage != null) {
      json[r'AccessoriesUsage'] = accessoriesUsage;
    }
    if (smokeSessions != null) {
      json[r'SmokeSessions'] = smokeSessions;
    }
    return json;
  }

  /// Returns a new [PersonStatisticsOverallDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static PersonStatisticsOverallDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : PersonStatisticsOverallDto(
        timeStatistics: SmokeSessionTimeStatisticsDto.fromJson(json[r'TimeStatistics']),
        accessoriesUsage: PipeAccessoryUsageDto.listFromJson(json[r'AccessoriesUsage']),
        smokeSessions: SmokeSessionSimpleDto.listFromJson(json[r'SmokeSessions']),
    );

  static List<PersonStatisticsOverallDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <PersonStatisticsOverallDto>[]
      : json.map((v) => PersonStatisticsOverallDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, PersonStatisticsOverallDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, PersonStatisticsOverallDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = PersonStatisticsOverallDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of PersonStatisticsOverallDto-objects as value to a dart map
  static Map<String, List<PersonStatisticsOverallDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<PersonStatisticsOverallDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = PersonStatisticsOverallDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


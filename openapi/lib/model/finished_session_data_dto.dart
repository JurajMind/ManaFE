//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FinishedSessionDataDto {
  /// Returns a new [FinishedSessionDataDto] instance.
  FinishedSessionDataDto({
    this.data,
    this.metaData,
    this.statistics,
    this.assigned,
  });

  SmokeSessionSimpleDto data;

  SmokeSessionMetaDataDto metaData;

  SmokeSessionStatisticsDto statistics;

  bool assigned;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FinishedSessionDataDto &&
     other.data == data &&
     other.metaData == metaData &&
     other.statistics == statistics &&
     other.assigned == assigned;

  @override
  int get hashCode =>
    (data == null ? 0 : data.hashCode) +
    (metaData == null ? 0 : metaData.hashCode) +
    (statistics == null ? 0 : statistics.hashCode) +
    (assigned == null ? 0 : assigned.hashCode);

  @override
  String toString() => 'FinishedSessionDataDto[data=$data, metaData=$metaData, statistics=$statistics, assigned=$assigned]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (data != null) {
      json[r'Data'] = data;
    }
    if (metaData != null) {
      json[r'MetaData'] = metaData;
    }
    if (statistics != null) {
      json[r'Statistics'] = statistics;
    }
    if (assigned != null) {
      json[r'Assigned'] = assigned;
    }
    return json;
  }

  /// Returns a new [FinishedSessionDataDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static FinishedSessionDataDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : FinishedSessionDataDto(
        data: SmokeSessionSimpleDto.fromJson(json[r'Data']),
        metaData: SmokeSessionMetaDataDto.fromJson(json[r'MetaData']),
        statistics: SmokeSessionStatisticsDto.fromJson(json[r'Statistics']),
        assigned: json[r'Assigned'],
    );

  static List<FinishedSessionDataDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <FinishedSessionDataDto>[]
      : json.map((v) => FinishedSessionDataDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, FinishedSessionDataDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, FinishedSessionDataDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = FinishedSessionDataDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of FinishedSessionDataDto-objects as value to a dart map
  static Map<String, List<FinishedSessionDataDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<FinishedSessionDataDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = FinishedSessionDataDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


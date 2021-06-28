//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DynamicSmokeStatisticRawDto {
  /// Returns a new [DynamicSmokeStatisticRawDto] instance.
  DynamicSmokeStatisticRawDto({
    this.pufCount,
    this.lastPuf,
    this.lastPufTime,
    this.smokeDuration,
    this.longestPuf,
    this.start,
    this.duration,
    this.longestPufMilis,
  });

  int pufCount;

  int lastPuf;

  int lastPufTime;

  int smokeDuration;

  int longestPuf;

  int start;

  int duration;

  int longestPufMilis;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DynamicSmokeStatisticRawDto &&
     other.pufCount == pufCount &&
     other.lastPuf == lastPuf &&
     other.lastPufTime == lastPufTime &&
     other.smokeDuration == smokeDuration &&
     other.longestPuf == longestPuf &&
     other.start == start &&
     other.duration == duration &&
     other.longestPufMilis == longestPufMilis;

  @override
  int get hashCode =>
    (pufCount == null ? 0 : pufCount.hashCode) +
    (lastPuf == null ? 0 : lastPuf.hashCode) +
    (lastPufTime == null ? 0 : lastPufTime.hashCode) +
    (smokeDuration == null ? 0 : smokeDuration.hashCode) +
    (longestPuf == null ? 0 : longestPuf.hashCode) +
    (start == null ? 0 : start.hashCode) +
    (duration == null ? 0 : duration.hashCode) +
    (longestPufMilis == null ? 0 : longestPufMilis.hashCode);

  @override
  String toString() => 'DynamicSmokeStatisticRawDto[pufCount=$pufCount, lastPuf=$lastPuf, lastPufTime=$lastPufTime, smokeDuration=$smokeDuration, longestPuf=$longestPuf, start=$start, duration=$duration, longestPufMilis=$longestPufMilis]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (pufCount != null) {
      json[r'PufCount'] = pufCount;
    }
    if (lastPuf != null) {
      json[r'LastPuf'] = lastPuf;
    }
    if (lastPufTime != null) {
      json[r'LastPufTime'] = lastPufTime;
    }
    if (smokeDuration != null) {
      json[r'SmokeDuration'] = smokeDuration;
    }
    if (longestPuf != null) {
      json[r'LongestPuf'] = longestPuf;
    }
    if (start != null) {
      json[r'Start'] = start;
    }
    if (duration != null) {
      json[r'Duration'] = duration;
    }
    if (longestPufMilis != null) {
      json[r'LongestPufMilis'] = longestPufMilis;
    }
    return json;
  }

  /// Returns a new [DynamicSmokeStatisticRawDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static DynamicSmokeStatisticRawDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : DynamicSmokeStatisticRawDto(
        pufCount: json[r'PufCount'],
        lastPuf: json[r'LastPuf'],
        lastPufTime: json[r'LastPufTime'],
        smokeDuration: json[r'SmokeDuration'],
        longestPuf: json[r'LongestPuf'],
        start: json[r'Start'],
        duration: json[r'Duration'],
        longestPufMilis: json[r'LongestPufMilis'],
    );

  static List<DynamicSmokeStatisticRawDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <DynamicSmokeStatisticRawDto>[]
      : json.map((v) => DynamicSmokeStatisticRawDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, DynamicSmokeStatisticRawDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, DynamicSmokeStatisticRawDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = DynamicSmokeStatisticRawDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of DynamicSmokeStatisticRawDto-objects as value to a dart map
  static Map<String, List<DynamicSmokeStatisticRawDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<DynamicSmokeStatisticRawDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = DynamicSmokeStatisticRawDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


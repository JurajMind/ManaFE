//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SmartHookahModelsRedisCompetitionEntry {
  /// Returns a new [SmartHookahModelsRedisCompetitionEntry] instance.
  SmartHookahModelsRedisCompetitionEntry({
    this.name,
    this.time,
  });

  String name;

  double time;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahModelsRedisCompetitionEntry &&
     other.name == name &&
     other.time == time;

  @override
  int get hashCode =>
    (name == null ? 0 : name.hashCode) +
    (time == null ? 0 : time.hashCode);

  @override
  String toString() => 'SmartHookahModelsRedisCompetitionEntry[name=$name, time=$time]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (name != null) {
      json[r'Name'] = name;
    }
    if (time != null) {
      json[r'Time'] = time;
    }
    return json;
  }

  /// Returns a new [SmartHookahModelsRedisCompetitionEntry] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static SmartHookahModelsRedisCompetitionEntry fromJson(Map<String, dynamic> json) => json == null
    ? null
    : SmartHookahModelsRedisCompetitionEntry(
        name: json[r'Name'],
        time: json[r'Time'],
    );

  static List<SmartHookahModelsRedisCompetitionEntry> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmartHookahModelsRedisCompetitionEntry>[]
      : json.map((v) => SmartHookahModelsRedisCompetitionEntry.fromJson(v)).toList(growable: true == growable);

  static Map<String, SmartHookahModelsRedisCompetitionEntry> mapFromJson(Map<String, dynamic> json) {
    final map = <String, SmartHookahModelsRedisCompetitionEntry>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = SmartHookahModelsRedisCompetitionEntry.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of SmartHookahModelsRedisCompetitionEntry-objects as value to a dart map
  static Map<String, List<SmartHookahModelsRedisCompetitionEntry>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<SmartHookahModelsRedisCompetitionEntry>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = SmartHookahModelsRedisCompetitionEntry.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


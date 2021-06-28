//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SmartHookahModelsDbColor {
  /// Returns a new [SmartHookahModelsDbColor] instance.
  SmartHookahModelsDbColor({
    this.hue,
    this.saturation,
    this.value,
  });

  int hue;

  int saturation;

  int value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahModelsDbColor &&
     other.hue == hue &&
     other.saturation == saturation &&
     other.value == value;

  @override
  int get hashCode =>
    (hue == null ? 0 : hue.hashCode) +
    (saturation == null ? 0 : saturation.hashCode) +
    (value == null ? 0 : value.hashCode);

  @override
  String toString() => 'SmartHookahModelsDbColor[hue=$hue, saturation=$saturation, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (hue != null) {
      json[r'Hue'] = hue;
    }
    if (saturation != null) {
      json[r'Saturation'] = saturation;
    }
    if (value != null) {
      json[r'Value'] = value;
    }
    return json;
  }

  /// Returns a new [SmartHookahModelsDbColor] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static SmartHookahModelsDbColor fromJson(Map<String, dynamic> json) => json == null
    ? null
    : SmartHookahModelsDbColor(
        hue: json[r'Hue'],
        saturation: json[r'Saturation'],
        value: json[r'Value'],
    );

  static List<SmartHookahModelsDbColor> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmartHookahModelsDbColor>[]
      : json.map((v) => SmartHookahModelsDbColor.fromJson(v)).toList(growable: true == growable);

  static Map<String, SmartHookahModelsDbColor> mapFromJson(Map<String, dynamic> json) {
    final map = <String, SmartHookahModelsDbColor>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = SmartHookahModelsDbColor.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of SmartHookahModelsDbColor-objects as value to a dart map
  static Map<String, List<SmartHookahModelsDbColor>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<SmartHookahModelsDbColor>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = SmartHookahModelsDbColor.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


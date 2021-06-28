//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ActionSettings {
  /// Returns a new [ActionSettings] instance.
  ActionSettings({
    this.color,
    this.animationId,
    this.brightness,
    this.speed,
  });

  SmartHookahModelsDbColor color;

  int animationId;

  int brightness;

  int speed;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ActionSettings &&
     other.color == color &&
     other.animationId == animationId &&
     other.brightness == brightness &&
     other.speed == speed;

  @override
  int get hashCode =>
    (color == null ? 0 : color.hashCode) +
    (animationId == null ? 0 : animationId.hashCode) +
    (brightness == null ? 0 : brightness.hashCode) +
    (speed == null ? 0 : speed.hashCode);

  @override
  String toString() => 'ActionSettings[color=$color, animationId=$animationId, brightness=$brightness, speed=$speed]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (color != null) {
      json[r'Color'] = color;
    }
    if (animationId != null) {
      json[r'AnimationId'] = animationId;
    }
    if (brightness != null) {
      json[r'Brightness'] = brightness;
    }
    if (speed != null) {
      json[r'Speed'] = speed;
    }
    return json;
  }

  /// Returns a new [ActionSettings] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static ActionSettings fromJson(Map<String, dynamic> json) => json == null
    ? null
    : ActionSettings(
        color: SmartHookahModelsDbColor.fromJson(json[r'Color']),
        animationId: json[r'AnimationId'],
        brightness: json[r'Brightness'],
        speed: json[r'Speed'],
    );

  static List<ActionSettings> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ActionSettings>[]
      : json.map((v) => ActionSettings.fromJson(v)).toList(growable: true == growable);

  static Map<String, ActionSettings> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ActionSettings>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = ActionSettings.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of ActionSettings-objects as value to a dart map
  static Map<String, List<ActionSettings>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ActionSettings>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = ActionSettings.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


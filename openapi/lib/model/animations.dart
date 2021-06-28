//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Animations {
  /// Returns a new [Animations] instance.
  Animations({
    this.animations = const [],
    this.success,
    this.message,
    this.httpResponseCode,
  });

  List<SmartHookahHelpersAnimation> animations;

  bool success;

  String message;

  int httpResponseCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Animations &&
     other.animations == animations &&
     other.success == success &&
     other.message == message &&
     other.httpResponseCode == httpResponseCode;

  @override
  int get hashCode =>
    (animations == null ? 0 : animations.hashCode) +
    (success == null ? 0 : success.hashCode) +
    (message == null ? 0 : message.hashCode) +
    (httpResponseCode == null ? 0 : httpResponseCode.hashCode);

  @override
  String toString() => 'Animations[animations=$animations, success=$success, message=$message, httpResponseCode=$httpResponseCode]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (animations != null) {
      json[r'Animations'] = animations;
    }
    if (success != null) {
      json[r'Success'] = success;
    }
    if (message != null) {
      json[r'Message'] = message;
    }
    if (httpResponseCode != null) {
      json[r'HttpResponseCode'] = httpResponseCode;
    }
    return json;
  }

  /// Returns a new [Animations] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static Animations fromJson(Map<String, dynamic> json) => json == null
    ? null
    : Animations(
        animations: SmartHookahHelpersAnimation.listFromJson(json[r'Animations']),
        success: json[r'Success'],
        message: json[r'Message'],
        httpResponseCode: json[r'HttpResponseCode'],
    );

  static List<Animations> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <Animations>[]
      : json.map((v) => Animations.fromJson(v)).toList(growable: true == growable);

  static Map<String, Animations> mapFromJson(Map<String, dynamic> json) {
    final map = <String, Animations>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = Animations.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of Animations-objects as value to a dart map
  static Map<String, List<Animations>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<Animations>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = Animations.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


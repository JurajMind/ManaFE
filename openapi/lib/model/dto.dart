//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Dto {
  /// Returns a new [Dto] instance.
  Dto({
    this.success,
    this.message,
    this.httpResponseCode,
  });

  bool success;

  String message;

  int httpResponseCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Dto &&
     other.success == success &&
     other.message == message &&
     other.httpResponseCode == httpResponseCode;

  @override
  int get hashCode =>
    (success == null ? 0 : success.hashCode) +
    (message == null ? 0 : message.hashCode) +
    (httpResponseCode == null ? 0 : httpResponseCode.hashCode);

  @override
  String toString() => 'Dto[success=$success, message=$message, httpResponseCode=$httpResponseCode]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
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

  /// Returns a new [Dto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static Dto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : Dto(
        success: json[r'Success'],
        message: json[r'Message'],
        httpResponseCode: json[r'HttpResponseCode'],
    );

  static List<Dto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <Dto>[]
      : json.map((v) => Dto.fromJson(v)).toList(growable: true == growable);

  static Map<String, Dto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, Dto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = Dto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of Dto-objects as value to a dart map
  static Map<String, List<Dto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<Dto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = Dto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


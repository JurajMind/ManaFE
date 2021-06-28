//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SmartHookahModelsDbSocialMedia {
  /// Returns a new [SmartHookahModelsDbSocialMedia] instance.
  SmartHookahModelsDbSocialMedia({
    this.id,
    this.code,
    this.url,
  });

  int id;

  String code;

  String url;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahModelsDbSocialMedia &&
     other.id == id &&
     other.code == code &&
     other.url == url;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (code == null ? 0 : code.hashCode) +
    (url == null ? 0 : url.hashCode);

  @override
  String toString() => 'SmartHookahModelsDbSocialMedia[id=$id, code=$code, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'Id'] = id;
    }
    if (code != null) {
      json[r'Code'] = code;
    }
    if (url != null) {
      json[r'Url'] = url;
    }
    return json;
  }

  /// Returns a new [SmartHookahModelsDbSocialMedia] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static SmartHookahModelsDbSocialMedia fromJson(Map<String, dynamic> json) => json == null
    ? null
    : SmartHookahModelsDbSocialMedia(
        id: json[r'Id'],
        code: json[r'Code'],
        url: json[r'Url'],
    );

  static List<SmartHookahModelsDbSocialMedia> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmartHookahModelsDbSocialMedia>[]
      : json.map((v) => SmartHookahModelsDbSocialMedia.fromJson(v)).toList(growable: true == growable);

  static Map<String, SmartHookahModelsDbSocialMedia> mapFromJson(Map<String, dynamic> json) {
    final map = <String, SmartHookahModelsDbSocialMedia>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = SmartHookahModelsDbSocialMedia.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of SmartHookahModelsDbSocialMedia-objects as value to a dart map
  static Map<String, List<SmartHookahModelsDbSocialMedia>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<SmartHookahModelsDbSocialMedia>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = SmartHookahModelsDbSocialMedia.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


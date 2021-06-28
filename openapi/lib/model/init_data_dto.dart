//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InitDataDto {
  /// Returns a new [InitDataDto] instance.
  InitDataDto({
    this.smokeSession,
    this.deviceSettings,
  });

  SmokeSessionSimpleDto smokeSession;

  DeviceSettingDto deviceSettings;

  @override
  bool operator ==(Object other) => identical(this, other) || other is InitDataDto &&
     other.smokeSession == smokeSession &&
     other.deviceSettings == deviceSettings;

  @override
  int get hashCode =>
    (smokeSession == null ? 0 : smokeSession.hashCode) +
    (deviceSettings == null ? 0 : deviceSettings.hashCode);

  @override
  String toString() => 'InitDataDto[smokeSession=$smokeSession, deviceSettings=$deviceSettings]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (smokeSession != null) {
      json[r'SmokeSession'] = smokeSession;
    }
    if (deviceSettings != null) {
      json[r'DeviceSettings'] = deviceSettings;
    }
    return json;
  }

  /// Returns a new [InitDataDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static InitDataDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : InitDataDto(
        smokeSession: SmokeSessionSimpleDto.fromJson(json[r'SmokeSession']),
        deviceSettings: DeviceSettingDto.fromJson(json[r'DeviceSettings']),
    );

  static List<InitDataDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <InitDataDto>[]
      : json.map((v) => InitDataDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, InitDataDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, InitDataDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = InitDataDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of InitDataDto-objects as value to a dart map
  static Map<String, List<InitDataDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<InitDataDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = InitDataDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DeviceSettingDto {
  /// Returns a new [DeviceSettingDto] instance.
  DeviceSettingDto({
    this.puffSettings,
    this.blowSettings,
    this.idleSettings,
  });

  ActionSettings puffSettings;

  ActionSettings blowSettings;

  ActionSettings idleSettings;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DeviceSettingDto &&
     other.puffSettings == puffSettings &&
     other.blowSettings == blowSettings &&
     other.idleSettings == idleSettings;

  @override
  int get hashCode =>
    (puffSettings == null ? 0 : puffSettings.hashCode) +
    (blowSettings == null ? 0 : blowSettings.hashCode) +
    (idleSettings == null ? 0 : idleSettings.hashCode);

  @override
  String toString() => 'DeviceSettingDto[puffSettings=$puffSettings, blowSettings=$blowSettings, idleSettings=$idleSettings]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (puffSettings != null) {
      json[r'PuffSettings'] = puffSettings;
    }
    if (blowSettings != null) {
      json[r'BlowSettings'] = blowSettings;
    }
    if (idleSettings != null) {
      json[r'IdleSettings'] = idleSettings;
    }
    return json;
  }

  /// Returns a new [DeviceSettingDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static DeviceSettingDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : DeviceSettingDto(
        puffSettings: ActionSettings.fromJson(json[r'PuffSettings']),
        blowSettings: ActionSettings.fromJson(json[r'BlowSettings']),
        idleSettings: ActionSettings.fromJson(json[r'IdleSettings']),
    );

  static List<DeviceSettingDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <DeviceSettingDto>[]
      : json.map((v) => DeviceSettingDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, DeviceSettingDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, DeviceSettingDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = DeviceSettingDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of DeviceSettingDto-objects as value to a dart map
  static Map<String, List<DeviceSettingDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<DeviceSettingDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = DeviceSettingDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


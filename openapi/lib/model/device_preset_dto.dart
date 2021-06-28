//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DevicePresetDto {
  /// Returns a new [DevicePresetDto] instance.
  DevicePresetDto({
    this.id,
    this.name,
    this.personId,
    this.setting,
  });

  int id;

  String name;

  int personId;

  DeviceSettingDto setting;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DevicePresetDto &&
     other.id == id &&
     other.name == name &&
     other.personId == personId &&
     other.setting == setting;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (name == null ? 0 : name.hashCode) +
    (personId == null ? 0 : personId.hashCode) +
    (setting == null ? 0 : setting.hashCode);

  @override
  String toString() => 'DevicePresetDto[id=$id, name=$name, personId=$personId, setting=$setting]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'id'] = id;
    }
    if (name != null) {
      json[r'name'] = name;
    }
    if (personId != null) {
      json[r'personId'] = personId;
    }
    if (setting != null) {
      json[r'setting'] = setting;
    }
    return json;
  }

  /// Returns a new [DevicePresetDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static DevicePresetDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : DevicePresetDto(
        id: json[r'id'],
        name: json[r'name'],
        personId: json[r'personId'],
        setting: DeviceSettingDto.fromJson(json[r'setting']),
    );

  static List<DevicePresetDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <DevicePresetDto>[]
      : json.map((v) => DevicePresetDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, DevicePresetDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, DevicePresetDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = DevicePresetDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of DevicePresetDto-objects as value to a dart map
  static Map<String, List<DevicePresetDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<DevicePresetDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = DevicePresetDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


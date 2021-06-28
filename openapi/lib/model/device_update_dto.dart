//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DeviceUpdateDto {
  /// Returns a new [DeviceUpdateDto] instance.
  DeviceUpdateDto({
    this.id,
    this.version,
    this.releseDate,
    this.releseNote,
    this.type,
  });

  int id;

  int version;

  DateTime releseDate;

  String releseNote;

  DeviceUpdateDtoTypeEnum type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DeviceUpdateDto &&
     other.id == id &&
     other.version == version &&
     other.releseDate == releseDate &&
     other.releseNote == releseNote &&
     other.type == type;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (version == null ? 0 : version.hashCode) +
    (releseDate == null ? 0 : releseDate.hashCode) +
    (releseNote == null ? 0 : releseNote.hashCode) +
    (type == null ? 0 : type.hashCode);

  @override
  String toString() => 'DeviceUpdateDto[id=$id, version=$version, releseDate=$releseDate, releseNote=$releseNote, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'Id'] = id;
    }
    if (version != null) {
      json[r'Version'] = version;
    }
    if (releseDate != null) {
      json[r'ReleseDate'] = releseDate.toUtc().toIso8601String();
    }
    if (releseNote != null) {
      json[r'ReleseNote'] = releseNote;
    }
    if (type != null) {
      json[r'Type'] = type;
    }
    return json;
  }

  /// Returns a new [DeviceUpdateDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static DeviceUpdateDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : DeviceUpdateDto(
        id: json[r'Id'],
        version: json[r'Version'],
        releseDate: json[r'ReleseDate'] == null
          ? null
          : DateTime.parse(json[r'ReleseDate']),
        releseNote: json[r'ReleseNote'],
        type: DeviceUpdateDtoTypeEnum.fromJson(json[r'Type']),
    );

  static List<DeviceUpdateDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <DeviceUpdateDto>[]
      : json.map((v) => DeviceUpdateDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, DeviceUpdateDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, DeviceUpdateDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = DeviceUpdateDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of DeviceUpdateDto-objects as value to a dart map
  static Map<String, List<DeviceUpdateDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<DeviceUpdateDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = DeviceUpdateDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


class DeviceUpdateDtoTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const DeviceUpdateDtoTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final int value;

  @override
  String toString() => value.toString();

  int toJson() => value;

  static const number0 = DeviceUpdateDtoTypeEnum._(0);
  static const number1 = DeviceUpdateDtoTypeEnum._(1);
  static const number2 = DeviceUpdateDtoTypeEnum._(2);
  static const number3 = DeviceUpdateDtoTypeEnum._(3);

  /// List of all possible values in this [enum][DeviceUpdateDtoTypeEnum].
  static const values = <DeviceUpdateDtoTypeEnum>[
    number0,
    number1,
    number2,
    number3,
  ];

  static DeviceUpdateDtoTypeEnum fromJson(dynamic value) =>
    DeviceUpdateDtoTypeEnumTypeTransformer().decode(value);

  static List<DeviceUpdateDtoTypeEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <DeviceUpdateDtoTypeEnum>[]
      : json
          .map((value) => DeviceUpdateDtoTypeEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [DeviceUpdateDtoTypeEnum] to int,
/// and [decode] dynamic data back to [DeviceUpdateDtoTypeEnum].
class DeviceUpdateDtoTypeEnumTypeTransformer {
  const DeviceUpdateDtoTypeEnumTypeTransformer._();

  factory DeviceUpdateDtoTypeEnumTypeTransformer() => _instance ??= DeviceUpdateDtoTypeEnumTypeTransformer._();

  int encode(DeviceUpdateDtoTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a DeviceUpdateDtoTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  DeviceUpdateDtoTypeEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case 0: return DeviceUpdateDtoTypeEnum.number0;
      case 1: return DeviceUpdateDtoTypeEnum.number1;
      case 2: return DeviceUpdateDtoTypeEnum.number2;
      case 3: return DeviceUpdateDtoTypeEnum.number3;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [DeviceUpdateDtoTypeEnumTypeTransformer] instance.
  static DeviceUpdateDtoTypeEnumTypeTransformer _instance;
}


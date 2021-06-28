//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DeviceSimpleDto {
  /// Returns a new [DeviceSimpleDto] instance.
  DeviceSimpleDto({
    this.id,
    this.name,
    this.code,
    this.isOnline,
    this.type,
    this.version,
  });

  int id;

  String name;

  String code;

  bool isOnline;

  DeviceSimpleDtoTypeEnum type;

  int version;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DeviceSimpleDto &&
     other.id == id &&
     other.name == name &&
     other.code == code &&
     other.isOnline == isOnline &&
     other.type == type &&
     other.version == version;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (name == null ? 0 : name.hashCode) +
    (code == null ? 0 : code.hashCode) +
    (isOnline == null ? 0 : isOnline.hashCode) +
    (type == null ? 0 : type.hashCode) +
    (version == null ? 0 : version.hashCode);

  @override
  String toString() => 'DeviceSimpleDto[id=$id, name=$name, code=$code, isOnline=$isOnline, type=$type, version=$version]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'Id'] = id;
    }
    if (name != null) {
      json[r'Name'] = name;
    }
    if (code != null) {
      json[r'Code'] = code;
    }
    if (isOnline != null) {
      json[r'IsOnline'] = isOnline;
    }
    if (type != null) {
      json[r'Type'] = type;
    }
    if (version != null) {
      json[r'Version'] = version;
    }
    return json;
  }

  /// Returns a new [DeviceSimpleDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static DeviceSimpleDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : DeviceSimpleDto(
        id: json[r'Id'],
        name: json[r'Name'],
        code: json[r'Code'],
        isOnline: json[r'IsOnline'],
        type: DeviceSimpleDtoTypeEnum.fromJson(json[r'Type']),
        version: json[r'Version'],
    );

  static List<DeviceSimpleDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <DeviceSimpleDto>[]
      : json.map((v) => DeviceSimpleDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, DeviceSimpleDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, DeviceSimpleDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = DeviceSimpleDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of DeviceSimpleDto-objects as value to a dart map
  static Map<String, List<DeviceSimpleDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<DeviceSimpleDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = DeviceSimpleDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


class DeviceSimpleDtoTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const DeviceSimpleDtoTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final int value;

  @override
  String toString() => value.toString();

  int toJson() => value;

  static const number0 = DeviceSimpleDtoTypeEnum._(0);
  static const number1 = DeviceSimpleDtoTypeEnum._(1);
  static const number2 = DeviceSimpleDtoTypeEnum._(2);
  static const number3 = DeviceSimpleDtoTypeEnum._(3);
  static const number4 = DeviceSimpleDtoTypeEnum._(4);
  static const number5 = DeviceSimpleDtoTypeEnum._(5);
  static const number6 = DeviceSimpleDtoTypeEnum._(6);
  static const number7 = DeviceSimpleDtoTypeEnum._(7);
  static const number8 = DeviceSimpleDtoTypeEnum._(8);
  static const number9 = DeviceSimpleDtoTypeEnum._(9);
  static const number10 = DeviceSimpleDtoTypeEnum._(10);
  static const number11 = DeviceSimpleDtoTypeEnum._(11);
  static const number12 = DeviceSimpleDtoTypeEnum._(12);
  static const number13 = DeviceSimpleDtoTypeEnum._(13);

  /// List of all possible values in this [enum][DeviceSimpleDtoTypeEnum].
  static const values = <DeviceSimpleDtoTypeEnum>[
    number0,
    number1,
    number2,
    number3,
    number4,
    number5,
    number6,
    number7,
    number8,
    number9,
    number10,
    number11,
    number12,
    number13,
  ];

  static DeviceSimpleDtoTypeEnum fromJson(dynamic value) =>
    DeviceSimpleDtoTypeEnumTypeTransformer().decode(value);

  static List<DeviceSimpleDtoTypeEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <DeviceSimpleDtoTypeEnum>[]
      : json
          .map((value) => DeviceSimpleDtoTypeEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [DeviceSimpleDtoTypeEnum] to int,
/// and [decode] dynamic data back to [DeviceSimpleDtoTypeEnum].
class DeviceSimpleDtoTypeEnumTypeTransformer {
  const DeviceSimpleDtoTypeEnumTypeTransformer._();

  factory DeviceSimpleDtoTypeEnumTypeTransformer() => _instance ??= DeviceSimpleDtoTypeEnumTypeTransformer._();

  int encode(DeviceSimpleDtoTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a DeviceSimpleDtoTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  DeviceSimpleDtoTypeEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case 0: return DeviceSimpleDtoTypeEnum.number0;
      case 1: return DeviceSimpleDtoTypeEnum.number1;
      case 2: return DeviceSimpleDtoTypeEnum.number2;
      case 3: return DeviceSimpleDtoTypeEnum.number3;
      case 4: return DeviceSimpleDtoTypeEnum.number4;
      case 5: return DeviceSimpleDtoTypeEnum.number5;
      case 6: return DeviceSimpleDtoTypeEnum.number6;
      case 7: return DeviceSimpleDtoTypeEnum.number7;
      case 8: return DeviceSimpleDtoTypeEnum.number8;
      case 9: return DeviceSimpleDtoTypeEnum.number9;
      case 10: return DeviceSimpleDtoTypeEnum.number10;
      case 11: return DeviceSimpleDtoTypeEnum.number11;
      case 12: return DeviceSimpleDtoTypeEnum.number12;
      case 13: return DeviceSimpleDtoTypeEnum.number13;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [DeviceSimpleDtoTypeEnumTypeTransformer] instance.
  static DeviceSimpleDtoTypeEnumTypeTransformer _instance;
}


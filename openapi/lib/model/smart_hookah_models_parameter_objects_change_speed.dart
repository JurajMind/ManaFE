//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SmartHookahModelsParameterObjectsChangeSpeed {
  /// Returns a new [SmartHookahModelsParameterObjectsChangeSpeed] instance.
  SmartHookahModelsParameterObjectsChangeSpeed({
    this.speed,
    this.type,
  });

  // minimum: 0
  // maximum: 255
  int speed;

  SmartHookahModelsParameterObjectsChangeSpeedTypeEnum type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahModelsParameterObjectsChangeSpeed &&
     other.speed == speed &&
     other.type == type;

  @override
  int get hashCode =>
    (speed == null ? 0 : speed.hashCode) +
    (type == null ? 0 : type.hashCode);

  @override
  String toString() => 'SmartHookahModelsParameterObjectsChangeSpeed[speed=$speed, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (speed != null) {
      json[r'Speed'] = speed;
    }
    if (type != null) {
      json[r'Type'] = type;
    }
    return json;
  }

  /// Returns a new [SmartHookahModelsParameterObjectsChangeSpeed] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static SmartHookahModelsParameterObjectsChangeSpeed fromJson(Map<String, dynamic> json) => json == null
    ? null
    : SmartHookahModelsParameterObjectsChangeSpeed(
        speed: json[r'Speed'],
        type: SmartHookahModelsParameterObjectsChangeSpeedTypeEnum.fromJson(json[r'Type']),
    );

  static List<SmartHookahModelsParameterObjectsChangeSpeed> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmartHookahModelsParameterObjectsChangeSpeed>[]
      : json.map((v) => SmartHookahModelsParameterObjectsChangeSpeed.fromJson(v)).toList(growable: true == growable);

  static Map<String, SmartHookahModelsParameterObjectsChangeSpeed> mapFromJson(Map<String, dynamic> json) {
    final map = <String, SmartHookahModelsParameterObjectsChangeSpeed>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = SmartHookahModelsParameterObjectsChangeSpeed.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of SmartHookahModelsParameterObjectsChangeSpeed-objects as value to a dart map
  static Map<String, List<SmartHookahModelsParameterObjectsChangeSpeed>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<SmartHookahModelsParameterObjectsChangeSpeed>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = SmartHookahModelsParameterObjectsChangeSpeed.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


class SmartHookahModelsParameterObjectsChangeSpeedTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const SmartHookahModelsParameterObjectsChangeSpeedTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final int value;

  @override
  String toString() => value.toString();

  int toJson() => value;

  static const number0 = SmartHookahModelsParameterObjectsChangeSpeedTypeEnum._(0);
  static const number1 = SmartHookahModelsParameterObjectsChangeSpeedTypeEnum._(1);
  static const number2 = SmartHookahModelsParameterObjectsChangeSpeedTypeEnum._(2);

  /// List of all possible values in this [enum][SmartHookahModelsParameterObjectsChangeSpeedTypeEnum].
  static const values = <SmartHookahModelsParameterObjectsChangeSpeedTypeEnum>[
    number0,
    number1,
    number2,
  ];

  static SmartHookahModelsParameterObjectsChangeSpeedTypeEnum fromJson(dynamic value) =>
    SmartHookahModelsParameterObjectsChangeSpeedTypeEnumTypeTransformer().decode(value);

  static List<SmartHookahModelsParameterObjectsChangeSpeedTypeEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmartHookahModelsParameterObjectsChangeSpeedTypeEnum>[]
      : json
          .map((value) => SmartHookahModelsParameterObjectsChangeSpeedTypeEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [SmartHookahModelsParameterObjectsChangeSpeedTypeEnum] to int,
/// and [decode] dynamic data back to [SmartHookahModelsParameterObjectsChangeSpeedTypeEnum].
class SmartHookahModelsParameterObjectsChangeSpeedTypeEnumTypeTransformer {
  const SmartHookahModelsParameterObjectsChangeSpeedTypeEnumTypeTransformer._();

  factory SmartHookahModelsParameterObjectsChangeSpeedTypeEnumTypeTransformer() => _instance ??= SmartHookahModelsParameterObjectsChangeSpeedTypeEnumTypeTransformer._();

  int encode(SmartHookahModelsParameterObjectsChangeSpeedTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SmartHookahModelsParameterObjectsChangeSpeedTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SmartHookahModelsParameterObjectsChangeSpeedTypeEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case 0: return SmartHookahModelsParameterObjectsChangeSpeedTypeEnum.number0;
      case 1: return SmartHookahModelsParameterObjectsChangeSpeedTypeEnum.number1;
      case 2: return SmartHookahModelsParameterObjectsChangeSpeedTypeEnum.number2;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [SmartHookahModelsParameterObjectsChangeSpeedTypeEnumTypeTransformer] instance.
  static SmartHookahModelsParameterObjectsChangeSpeedTypeEnumTypeTransformer _instance;
}


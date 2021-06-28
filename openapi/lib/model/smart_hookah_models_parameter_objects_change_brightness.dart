//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SmartHookahModelsParameterObjectsChangeBrightness {
  /// Returns a new [SmartHookahModelsParameterObjectsChangeBrightness] instance.
  SmartHookahModelsParameterObjectsChangeBrightness({
    this.brightness,
    this.type,
  });

  // minimum: 0
  // maximum: 255
  int brightness;

  SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahModelsParameterObjectsChangeBrightness &&
     other.brightness == brightness &&
     other.type == type;

  @override
  int get hashCode =>
    (brightness == null ? 0 : brightness.hashCode) +
    (type == null ? 0 : type.hashCode);

  @override
  String toString() => 'SmartHookahModelsParameterObjectsChangeBrightness[brightness=$brightness, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (brightness != null) {
      json[r'Brightness'] = brightness;
    }
    if (type != null) {
      json[r'Type'] = type;
    }
    return json;
  }

  /// Returns a new [SmartHookahModelsParameterObjectsChangeBrightness] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static SmartHookahModelsParameterObjectsChangeBrightness fromJson(Map<String, dynamic> json) => json == null
    ? null
    : SmartHookahModelsParameterObjectsChangeBrightness(
        brightness: json[r'Brightness'],
        type: SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum.fromJson(json[r'Type']),
    );

  static List<SmartHookahModelsParameterObjectsChangeBrightness> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmartHookahModelsParameterObjectsChangeBrightness>[]
      : json.map((v) => SmartHookahModelsParameterObjectsChangeBrightness.fromJson(v)).toList(growable: true == growable);

  static Map<String, SmartHookahModelsParameterObjectsChangeBrightness> mapFromJson(Map<String, dynamic> json) {
    final map = <String, SmartHookahModelsParameterObjectsChangeBrightness>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = SmartHookahModelsParameterObjectsChangeBrightness.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of SmartHookahModelsParameterObjectsChangeBrightness-objects as value to a dart map
  static Map<String, List<SmartHookahModelsParameterObjectsChangeBrightness>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<SmartHookahModelsParameterObjectsChangeBrightness>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = SmartHookahModelsParameterObjectsChangeBrightness.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


class SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final int value;

  @override
  String toString() => value.toString();

  int toJson() => value;

  static const number0 = SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum._(0);
  static const number1 = SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum._(1);
  static const number2 = SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum._(2);

  /// List of all possible values in this [enum][SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum].
  static const values = <SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum>[
    number0,
    number1,
    number2,
  ];

  static SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum fromJson(dynamic value) =>
    SmartHookahModelsParameterObjectsChangeBrightnessTypeEnumTypeTransformer().decode(value);

  static List<SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum>[]
      : json
          .map((value) => SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum] to int,
/// and [decode] dynamic data back to [SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum].
class SmartHookahModelsParameterObjectsChangeBrightnessTypeEnumTypeTransformer {
  const SmartHookahModelsParameterObjectsChangeBrightnessTypeEnumTypeTransformer._();

  factory SmartHookahModelsParameterObjectsChangeBrightnessTypeEnumTypeTransformer() => _instance ??= SmartHookahModelsParameterObjectsChangeBrightnessTypeEnumTypeTransformer._();

  int encode(SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case 0: return SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum.number0;
      case 1: return SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum.number1;
      case 2: return SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum.number2;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [SmartHookahModelsParameterObjectsChangeBrightnessTypeEnumTypeTransformer] instance.
  static SmartHookahModelsParameterObjectsChangeBrightnessTypeEnumTypeTransformer _instance;
}


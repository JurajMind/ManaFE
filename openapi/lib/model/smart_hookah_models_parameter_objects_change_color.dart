//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SmartHookahModelsParameterObjectsChangeColor {
  /// Returns a new [SmartHookahModelsParameterObjectsChangeColor] instance.
  SmartHookahModelsParameterObjectsChangeColor({
    this.color,
    this.type,
  });

  SmartHookahModelsDbColor color;

  SmartHookahModelsParameterObjectsChangeColorTypeEnum type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahModelsParameterObjectsChangeColor &&
     other.color == color &&
     other.type == type;

  @override
  int get hashCode =>
    (color == null ? 0 : color.hashCode) +
    (type == null ? 0 : type.hashCode);

  @override
  String toString() => 'SmartHookahModelsParameterObjectsChangeColor[color=$color, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (color != null) {
      json[r'Color'] = color;
    }
    if (type != null) {
      json[r'Type'] = type;
    }
    return json;
  }

  /// Returns a new [SmartHookahModelsParameterObjectsChangeColor] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static SmartHookahModelsParameterObjectsChangeColor fromJson(Map<String, dynamic> json) => json == null
    ? null
    : SmartHookahModelsParameterObjectsChangeColor(
        color: SmartHookahModelsDbColor.fromJson(json[r'Color']),
        type: SmartHookahModelsParameterObjectsChangeColorTypeEnum.fromJson(json[r'Type']),
    );

  static List<SmartHookahModelsParameterObjectsChangeColor> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmartHookahModelsParameterObjectsChangeColor>[]
      : json.map((v) => SmartHookahModelsParameterObjectsChangeColor.fromJson(v)).toList(growable: true == growable);

  static Map<String, SmartHookahModelsParameterObjectsChangeColor> mapFromJson(Map<String, dynamic> json) {
    final map = <String, SmartHookahModelsParameterObjectsChangeColor>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = SmartHookahModelsParameterObjectsChangeColor.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of SmartHookahModelsParameterObjectsChangeColor-objects as value to a dart map
  static Map<String, List<SmartHookahModelsParameterObjectsChangeColor>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<SmartHookahModelsParameterObjectsChangeColor>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = SmartHookahModelsParameterObjectsChangeColor.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


class SmartHookahModelsParameterObjectsChangeColorTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const SmartHookahModelsParameterObjectsChangeColorTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final int value;

  @override
  String toString() => value.toString();

  int toJson() => value;

  static const number0 = SmartHookahModelsParameterObjectsChangeColorTypeEnum._(0);
  static const number1 = SmartHookahModelsParameterObjectsChangeColorTypeEnum._(1);
  static const number2 = SmartHookahModelsParameterObjectsChangeColorTypeEnum._(2);

  /// List of all possible values in this [enum][SmartHookahModelsParameterObjectsChangeColorTypeEnum].
  static const values = <SmartHookahModelsParameterObjectsChangeColorTypeEnum>[
    number0,
    number1,
    number2,
  ];

  static SmartHookahModelsParameterObjectsChangeColorTypeEnum fromJson(dynamic value) =>
    SmartHookahModelsParameterObjectsChangeColorTypeEnumTypeTransformer().decode(value);

  static List<SmartHookahModelsParameterObjectsChangeColorTypeEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmartHookahModelsParameterObjectsChangeColorTypeEnum>[]
      : json
          .map((value) => SmartHookahModelsParameterObjectsChangeColorTypeEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [SmartHookahModelsParameterObjectsChangeColorTypeEnum] to int,
/// and [decode] dynamic data back to [SmartHookahModelsParameterObjectsChangeColorTypeEnum].
class SmartHookahModelsParameterObjectsChangeColorTypeEnumTypeTransformer {
  const SmartHookahModelsParameterObjectsChangeColorTypeEnumTypeTransformer._();

  factory SmartHookahModelsParameterObjectsChangeColorTypeEnumTypeTransformer() => _instance ??= SmartHookahModelsParameterObjectsChangeColorTypeEnumTypeTransformer._();

  int encode(SmartHookahModelsParameterObjectsChangeColorTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SmartHookahModelsParameterObjectsChangeColorTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SmartHookahModelsParameterObjectsChangeColorTypeEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case 0: return SmartHookahModelsParameterObjectsChangeColorTypeEnum.number0;
      case 1: return SmartHookahModelsParameterObjectsChangeColorTypeEnum.number1;
      case 2: return SmartHookahModelsParameterObjectsChangeColorTypeEnum.number2;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [SmartHookahModelsParameterObjectsChangeColorTypeEnumTypeTransformer] instance.
  static SmartHookahModelsParameterObjectsChangeColorTypeEnumTypeTransformer _instance;
}


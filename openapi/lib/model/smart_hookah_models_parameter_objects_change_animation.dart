//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SmartHookahModelsParameterObjectsChangeAnimation {
  /// Returns a new [SmartHookahModelsParameterObjectsChangeAnimation] instance.
  SmartHookahModelsParameterObjectsChangeAnimation({
    this.animationId,
    this.type,
  });

  int animationId;

  SmartHookahModelsParameterObjectsChangeAnimationTypeEnum type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahModelsParameterObjectsChangeAnimation &&
     other.animationId == animationId &&
     other.type == type;

  @override
  int get hashCode =>
    (animationId == null ? 0 : animationId.hashCode) +
    (type == null ? 0 : type.hashCode);

  @override
  String toString() => 'SmartHookahModelsParameterObjectsChangeAnimation[animationId=$animationId, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (animationId != null) {
      json[r'AnimationId'] = animationId;
    }
    if (type != null) {
      json[r'Type'] = type;
    }
    return json;
  }

  /// Returns a new [SmartHookahModelsParameterObjectsChangeAnimation] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static SmartHookahModelsParameterObjectsChangeAnimation fromJson(Map<String, dynamic> json) => json == null
    ? null
    : SmartHookahModelsParameterObjectsChangeAnimation(
        animationId: json[r'AnimationId'],
        type: SmartHookahModelsParameterObjectsChangeAnimationTypeEnum.fromJson(json[r'Type']),
    );

  static List<SmartHookahModelsParameterObjectsChangeAnimation> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmartHookahModelsParameterObjectsChangeAnimation>[]
      : json.map((v) => SmartHookahModelsParameterObjectsChangeAnimation.fromJson(v)).toList(growable: true == growable);

  static Map<String, SmartHookahModelsParameterObjectsChangeAnimation> mapFromJson(Map<String, dynamic> json) {
    final map = <String, SmartHookahModelsParameterObjectsChangeAnimation>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = SmartHookahModelsParameterObjectsChangeAnimation.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of SmartHookahModelsParameterObjectsChangeAnimation-objects as value to a dart map
  static Map<String, List<SmartHookahModelsParameterObjectsChangeAnimation>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<SmartHookahModelsParameterObjectsChangeAnimation>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = SmartHookahModelsParameterObjectsChangeAnimation.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


class SmartHookahModelsParameterObjectsChangeAnimationTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const SmartHookahModelsParameterObjectsChangeAnimationTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final int value;

  @override
  String toString() => value.toString();

  int toJson() => value;

  static const number0 = SmartHookahModelsParameterObjectsChangeAnimationTypeEnum._(0);
  static const number1 = SmartHookahModelsParameterObjectsChangeAnimationTypeEnum._(1);
  static const number2 = SmartHookahModelsParameterObjectsChangeAnimationTypeEnum._(2);

  /// List of all possible values in this [enum][SmartHookahModelsParameterObjectsChangeAnimationTypeEnum].
  static const values = <SmartHookahModelsParameterObjectsChangeAnimationTypeEnum>[
    number0,
    number1,
    number2,
  ];

  static SmartHookahModelsParameterObjectsChangeAnimationTypeEnum fromJson(dynamic value) =>
    SmartHookahModelsParameterObjectsChangeAnimationTypeEnumTypeTransformer().decode(value);

  static List<SmartHookahModelsParameterObjectsChangeAnimationTypeEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmartHookahModelsParameterObjectsChangeAnimationTypeEnum>[]
      : json
          .map((value) => SmartHookahModelsParameterObjectsChangeAnimationTypeEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [SmartHookahModelsParameterObjectsChangeAnimationTypeEnum] to int,
/// and [decode] dynamic data back to [SmartHookahModelsParameterObjectsChangeAnimationTypeEnum].
class SmartHookahModelsParameterObjectsChangeAnimationTypeEnumTypeTransformer {
  const SmartHookahModelsParameterObjectsChangeAnimationTypeEnumTypeTransformer._();

  factory SmartHookahModelsParameterObjectsChangeAnimationTypeEnumTypeTransformer() => _instance ??= SmartHookahModelsParameterObjectsChangeAnimationTypeEnumTypeTransformer._();

  int encode(SmartHookahModelsParameterObjectsChangeAnimationTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SmartHookahModelsParameterObjectsChangeAnimationTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SmartHookahModelsParameterObjectsChangeAnimationTypeEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case 0: return SmartHookahModelsParameterObjectsChangeAnimationTypeEnum.number0;
      case 1: return SmartHookahModelsParameterObjectsChangeAnimationTypeEnum.number1;
      case 2: return SmartHookahModelsParameterObjectsChangeAnimationTypeEnum.number2;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [SmartHookahModelsParameterObjectsChangeAnimationTypeEnumTypeTransformer] instance.
  static SmartHookahModelsParameterObjectsChangeAnimationTypeEnumTypeTransformer _instance;
}


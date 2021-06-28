//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SmartHookahHelpersAnimation {
  /// Returns a new [SmartHookahHelpersAnimation] instance.
  SmartHookahHelpersAnimation({
    this.id,
    this.displayName,
    this.versionFrom,
    this.versionTo,
    this.usage,
    this.haveColor,
  });

  int id;

  String displayName;

  int versionFrom;

  int versionTo;

  SmartHookahHelpersAnimationUsageEnum usage;

  bool haveColor;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahHelpersAnimation &&
     other.id == id &&
     other.displayName == displayName &&
     other.versionFrom == versionFrom &&
     other.versionTo == versionTo &&
     other.usage == usage &&
     other.haveColor == haveColor;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (displayName == null ? 0 : displayName.hashCode) +
    (versionFrom == null ? 0 : versionFrom.hashCode) +
    (versionTo == null ? 0 : versionTo.hashCode) +
    (usage == null ? 0 : usage.hashCode) +
    (haveColor == null ? 0 : haveColor.hashCode);

  @override
  String toString() => 'SmartHookahHelpersAnimation[id=$id, displayName=$displayName, versionFrom=$versionFrom, versionTo=$versionTo, usage=$usage, haveColor=$haveColor]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'Id'] = id;
    }
    if (displayName != null) {
      json[r'DisplayName'] = displayName;
    }
    if (versionFrom != null) {
      json[r'VersionFrom'] = versionFrom;
    }
    if (versionTo != null) {
      json[r'VersionTo'] = versionTo;
    }
    if (usage != null) {
      json[r'Usage'] = usage;
    }
    if (haveColor != null) {
      json[r'HaveColor'] = haveColor;
    }
    return json;
  }

  /// Returns a new [SmartHookahHelpersAnimation] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static SmartHookahHelpersAnimation fromJson(Map<String, dynamic> json) => json == null
    ? null
    : SmartHookahHelpersAnimation(
        id: json[r'Id'],
        displayName: json[r'DisplayName'],
        versionFrom: json[r'VersionFrom'],
        versionTo: json[r'VersionTo'],
        usage: SmartHookahHelpersAnimationUsageEnum.fromJson(json[r'Usage']),
        haveColor: json[r'HaveColor'],
    );

  static List<SmartHookahHelpersAnimation> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmartHookahHelpersAnimation>[]
      : json.map((v) => SmartHookahHelpersAnimation.fromJson(v)).toList(growable: true == growable);

  static Map<String, SmartHookahHelpersAnimation> mapFromJson(Map<String, dynamic> json) {
    final map = <String, SmartHookahHelpersAnimation>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = SmartHookahHelpersAnimation.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of SmartHookahHelpersAnimation-objects as value to a dart map
  static Map<String, List<SmartHookahHelpersAnimation>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<SmartHookahHelpersAnimation>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = SmartHookahHelpersAnimation.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


class SmartHookahHelpersAnimationUsageEnum {
  /// Instantiate a new enum with the provided [value].
  const SmartHookahHelpersAnimationUsageEnum._(this.value);

  /// The underlying value of this enum member.
  final int value;

  @override
  String toString() => value.toString();

  int toJson() => value;

  static const number0 = SmartHookahHelpersAnimationUsageEnum._(0);
  static const number1 = SmartHookahHelpersAnimationUsageEnum._(1);
  static const number2 = SmartHookahHelpersAnimationUsageEnum._(2);
  static const number4 = SmartHookahHelpersAnimationUsageEnum._(4);
  static const number6 = SmartHookahHelpersAnimationUsageEnum._(6);
  static const number7 = SmartHookahHelpersAnimationUsageEnum._(7);

  /// List of all possible values in this [enum][SmartHookahHelpersAnimationUsageEnum].
  static const values = <SmartHookahHelpersAnimationUsageEnum>[
    number0,
    number1,
    number2,
    number4,
    number6,
    number7,
  ];

  static SmartHookahHelpersAnimationUsageEnum fromJson(dynamic value) =>
    SmartHookahHelpersAnimationUsageEnumTypeTransformer().decode(value);

  static List<SmartHookahHelpersAnimationUsageEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmartHookahHelpersAnimationUsageEnum>[]
      : json
          .map((value) => SmartHookahHelpersAnimationUsageEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [SmartHookahHelpersAnimationUsageEnum] to int,
/// and [decode] dynamic data back to [SmartHookahHelpersAnimationUsageEnum].
class SmartHookahHelpersAnimationUsageEnumTypeTransformer {
  const SmartHookahHelpersAnimationUsageEnumTypeTransformer._();

  factory SmartHookahHelpersAnimationUsageEnumTypeTransformer() => _instance ??= SmartHookahHelpersAnimationUsageEnumTypeTransformer._();

  int encode(SmartHookahHelpersAnimationUsageEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SmartHookahHelpersAnimationUsageEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SmartHookahHelpersAnimationUsageEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case 0: return SmartHookahHelpersAnimationUsageEnum.number0;
      case 1: return SmartHookahHelpersAnimationUsageEnum.number1;
      case 2: return SmartHookahHelpersAnimationUsageEnum.number2;
      case 4: return SmartHookahHelpersAnimationUsageEnum.number4;
      case 6: return SmartHookahHelpersAnimationUsageEnum.number6;
      case 7: return SmartHookahHelpersAnimationUsageEnum.number7;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [SmartHookahHelpersAnimationUsageEnumTypeTransformer] instance.
  static SmartHookahHelpersAnimationUsageEnumTypeTransformer _instance;
}


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SmartHookahModelsDbPuf {
  /// Returns a new [SmartHookahModelsDbPuf] instance.
  SmartHookahModelsDbPuf({
    this.sId,
    this.T,
    this.D,
    this.M,
    this.P,
  });

  String sId;

  SmartHookahModelsDbPufTEnum T;

  DateTime D;

  int M;

  int P;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahModelsDbPuf &&
     other.sId == sId &&
     other.T == T &&
     other.D == D &&
     other.M == M &&
     other.P == P;

  @override
  int get hashCode =>
    (sId == null ? 0 : sId.hashCode) +
    (T == null ? 0 : T.hashCode) +
    (D == null ? 0 : D.hashCode) +
    (M == null ? 0 : M.hashCode) +
    (P == null ? 0 : P.hashCode);

  @override
  String toString() => 'SmartHookahModelsDbPuf[sId=$sId, T=$T, D=$D, M=$M, P=$P]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (sId != null) {
      json[r'SId'] = sId;
    }
    if (T != null) {
      json[r'T'] = T;
    }
    if (D != null) {
      json[r'D'] = D.toUtc().toIso8601String();
    }
    if (M != null) {
      json[r'M'] = M;
    }
    if (P != null) {
      json[r'P'] = P;
    }
    return json;
  }

  /// Returns a new [SmartHookahModelsDbPuf] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static SmartHookahModelsDbPuf fromJson(Map<String, dynamic> json) => json == null
    ? null
    : SmartHookahModelsDbPuf(
        sId: json[r'SId'],
        T: SmartHookahModelsDbPufTEnum.fromJson(json[r'T']),
        D: json[r'D'] == null
          ? null
          : DateTime.parse(json[r'D']),
        M: json[r'M'],
        P: json[r'P'],
    );

  static List<SmartHookahModelsDbPuf> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmartHookahModelsDbPuf>[]
      : json.map((v) => SmartHookahModelsDbPuf.fromJson(v)).toList(growable: true == growable);

  static Map<String, SmartHookahModelsDbPuf> mapFromJson(Map<String, dynamic> json) {
    final map = <String, SmartHookahModelsDbPuf>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = SmartHookahModelsDbPuf.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of SmartHookahModelsDbPuf-objects as value to a dart map
  static Map<String, List<SmartHookahModelsDbPuf>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<SmartHookahModelsDbPuf>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = SmartHookahModelsDbPuf.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


class SmartHookahModelsDbPufTEnum {
  /// Instantiate a new enum with the provided [value].
  const SmartHookahModelsDbPufTEnum._(this.value);

  /// The underlying value of this enum member.
  final int value;

  @override
  String toString() => value.toString();

  int toJson() => value;

  static const number0 = SmartHookahModelsDbPufTEnum._(0);
  static const number1 = SmartHookahModelsDbPufTEnum._(1);
  static const number2 = SmartHookahModelsDbPufTEnum._(2);

  /// List of all possible values in this [enum][SmartHookahModelsDbPufTEnum].
  static const values = <SmartHookahModelsDbPufTEnum>[
    number0,
    number1,
    number2,
  ];

  static SmartHookahModelsDbPufTEnum fromJson(dynamic value) =>
    SmartHookahModelsDbPufTEnumTypeTransformer().decode(value);

  static List<SmartHookahModelsDbPufTEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmartHookahModelsDbPufTEnum>[]
      : json
          .map((value) => SmartHookahModelsDbPufTEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [SmartHookahModelsDbPufTEnum] to int,
/// and [decode] dynamic data back to [SmartHookahModelsDbPufTEnum].
class SmartHookahModelsDbPufTEnumTypeTransformer {
  const SmartHookahModelsDbPufTEnumTypeTransformer._();

  factory SmartHookahModelsDbPufTEnumTypeTransformer() => _instance ??= SmartHookahModelsDbPufTEnumTypeTransformer._();

  int encode(SmartHookahModelsDbPufTEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SmartHookahModelsDbPufTEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SmartHookahModelsDbPufTEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case 0: return SmartHookahModelsDbPufTEnum.number0;
      case 1: return SmartHookahModelsDbPufTEnum.number1;
      case 2: return SmartHookahModelsDbPufTEnum.number2;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [SmartHookahModelsDbPufTEnumTypeTransformer] instance.
  static SmartHookahModelsDbPufTEnumTypeTransformer _instance;
}


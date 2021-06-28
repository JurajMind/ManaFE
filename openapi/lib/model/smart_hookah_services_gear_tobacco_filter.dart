//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SmartHookahServicesGearTobaccoFilter {
  /// Returns a new [SmartHookahServicesGearTobaccoFilter] instance.
  SmartHookahServicesGearTobaccoFilter({
    this.tastes = const [],
    this.sortBy,
    this.brand,
    this.owned,
    this.smoked,
    this.sortDirection,
  });

  List<int> tastes;

  SmartHookahServicesGearTobaccoFilterSortByEnum sortBy;

  String brand;

  bool owned;

  bool smoked;

  SmartHookahServicesGearTobaccoFilterSortDirectionEnum sortDirection;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahServicesGearTobaccoFilter &&
     other.tastes == tastes &&
     other.sortBy == sortBy &&
     other.brand == brand &&
     other.owned == owned &&
     other.smoked == smoked &&
     other.sortDirection == sortDirection;

  @override
  int get hashCode =>
    (tastes == null ? 0 : tastes.hashCode) +
    (sortBy == null ? 0 : sortBy.hashCode) +
    (brand == null ? 0 : brand.hashCode) +
    (owned == null ? 0 : owned.hashCode) +
    (smoked == null ? 0 : smoked.hashCode) +
    (sortDirection == null ? 0 : sortDirection.hashCode);

  @override
  String toString() => 'SmartHookahServicesGearTobaccoFilter[tastes=$tastes, sortBy=$sortBy, brand=$brand, owned=$owned, smoked=$smoked, sortDirection=$sortDirection]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (tastes != null) {
      json[r'Tastes'] = tastes;
    }
    if (sortBy != null) {
      json[r'SortBy'] = sortBy;
    }
    if (brand != null) {
      json[r'Brand'] = brand;
    }
    if (owned != null) {
      json[r'Owned'] = owned;
    }
    if (smoked != null) {
      json[r'Smoked'] = smoked;
    }
    if (sortDirection != null) {
      json[r'SortDirection'] = sortDirection;
    }
    return json;
  }

  /// Returns a new [SmartHookahServicesGearTobaccoFilter] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static SmartHookahServicesGearTobaccoFilter fromJson(Map<String, dynamic> json) => json == null
    ? null
    : SmartHookahServicesGearTobaccoFilter(
        tastes: json[r'Tastes'] == null
          ? null
          : (json[r'Tastes'] as List).cast<int>(),
        sortBy: SmartHookahServicesGearTobaccoFilterSortByEnum.fromJson(json[r'SortBy']),
        brand: json[r'Brand'],
        owned: json[r'Owned'],
        smoked: json[r'Smoked'],
        sortDirection: SmartHookahServicesGearTobaccoFilterSortDirectionEnum.fromJson(json[r'SortDirection']),
    );

  static List<SmartHookahServicesGearTobaccoFilter> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmartHookahServicesGearTobaccoFilter>[]
      : json.map((v) => SmartHookahServicesGearTobaccoFilter.fromJson(v)).toList(growable: true == growable);

  static Map<String, SmartHookahServicesGearTobaccoFilter> mapFromJson(Map<String, dynamic> json) {
    final map = <String, SmartHookahServicesGearTobaccoFilter>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = SmartHookahServicesGearTobaccoFilter.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of SmartHookahServicesGearTobaccoFilter-objects as value to a dart map
  static Map<String, List<SmartHookahServicesGearTobaccoFilter>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<SmartHookahServicesGearTobaccoFilter>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = SmartHookahServicesGearTobaccoFilter.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


class SmartHookahServicesGearTobaccoFilterSortByEnum {
  /// Instantiate a new enum with the provided [value].
  const SmartHookahServicesGearTobaccoFilterSortByEnum._(this.value);

  /// The underlying value of this enum member.
  final int value;

  @override
  String toString() => value.toString();

  int toJson() => value;

  static const number0 = SmartHookahServicesGearTobaccoFilterSortByEnum._(0);
  static const number1 = SmartHookahServicesGearTobaccoFilterSortByEnum._(1);
  static const number2 = SmartHookahServicesGearTobaccoFilterSortByEnum._(2);
  static const number3 = SmartHookahServicesGearTobaccoFilterSortByEnum._(3);
  static const number4 = SmartHookahServicesGearTobaccoFilterSortByEnum._(4);

  /// List of all possible values in this [enum][SmartHookahServicesGearTobaccoFilterSortByEnum].
  static const values = <SmartHookahServicesGearTobaccoFilterSortByEnum>[
    number0,
    number1,
    number2,
    number3,
    number4,
  ];

  static SmartHookahServicesGearTobaccoFilterSortByEnum fromJson(dynamic value) =>
    SmartHookahServicesGearTobaccoFilterSortByEnumTypeTransformer().decode(value);

  static List<SmartHookahServicesGearTobaccoFilterSortByEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmartHookahServicesGearTobaccoFilterSortByEnum>[]
      : json
          .map((value) => SmartHookahServicesGearTobaccoFilterSortByEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [SmartHookahServicesGearTobaccoFilterSortByEnum] to int,
/// and [decode] dynamic data back to [SmartHookahServicesGearTobaccoFilterSortByEnum].
class SmartHookahServicesGearTobaccoFilterSortByEnumTypeTransformer {
  const SmartHookahServicesGearTobaccoFilterSortByEnumTypeTransformer._();

  factory SmartHookahServicesGearTobaccoFilterSortByEnumTypeTransformer() => _instance ??= SmartHookahServicesGearTobaccoFilterSortByEnumTypeTransformer._();

  int encode(SmartHookahServicesGearTobaccoFilterSortByEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SmartHookahServicesGearTobaccoFilterSortByEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SmartHookahServicesGearTobaccoFilterSortByEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case 0: return SmartHookahServicesGearTobaccoFilterSortByEnum.number0;
      case 1: return SmartHookahServicesGearTobaccoFilterSortByEnum.number1;
      case 2: return SmartHookahServicesGearTobaccoFilterSortByEnum.number2;
      case 3: return SmartHookahServicesGearTobaccoFilterSortByEnum.number3;
      case 4: return SmartHookahServicesGearTobaccoFilterSortByEnum.number4;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [SmartHookahServicesGearTobaccoFilterSortByEnumTypeTransformer] instance.
  static SmartHookahServicesGearTobaccoFilterSortByEnumTypeTransformer _instance;
}


class SmartHookahServicesGearTobaccoFilterSortDirectionEnum {
  /// Instantiate a new enum with the provided [value].
  const SmartHookahServicesGearTobaccoFilterSortDirectionEnum._(this.value);

  /// The underlying value of this enum member.
  final int value;

  @override
  String toString() => value.toString();

  int toJson() => value;

  static const number0 = SmartHookahServicesGearTobaccoFilterSortDirectionEnum._(0);
  static const number1 = SmartHookahServicesGearTobaccoFilterSortDirectionEnum._(1);

  /// List of all possible values in this [enum][SmartHookahServicesGearTobaccoFilterSortDirectionEnum].
  static const values = <SmartHookahServicesGearTobaccoFilterSortDirectionEnum>[
    number0,
    number1,
  ];

  static SmartHookahServicesGearTobaccoFilterSortDirectionEnum fromJson(dynamic value) =>
    SmartHookahServicesGearTobaccoFilterSortDirectionEnumTypeTransformer().decode(value);

  static List<SmartHookahServicesGearTobaccoFilterSortDirectionEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmartHookahServicesGearTobaccoFilterSortDirectionEnum>[]
      : json
          .map((value) => SmartHookahServicesGearTobaccoFilterSortDirectionEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [SmartHookahServicesGearTobaccoFilterSortDirectionEnum] to int,
/// and [decode] dynamic data back to [SmartHookahServicesGearTobaccoFilterSortDirectionEnum].
class SmartHookahServicesGearTobaccoFilterSortDirectionEnumTypeTransformer {
  const SmartHookahServicesGearTobaccoFilterSortDirectionEnumTypeTransformer._();

  factory SmartHookahServicesGearTobaccoFilterSortDirectionEnumTypeTransformer() => _instance ??= SmartHookahServicesGearTobaccoFilterSortDirectionEnumTypeTransformer._();

  int encode(SmartHookahServicesGearTobaccoFilterSortDirectionEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SmartHookahServicesGearTobaccoFilterSortDirectionEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SmartHookahServicesGearTobaccoFilterSortDirectionEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case 0: return SmartHookahServicesGearTobaccoFilterSortDirectionEnum.number0;
      case 1: return SmartHookahServicesGearTobaccoFilterSortDirectionEnum.number1;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [SmartHookahServicesGearTobaccoFilterSortDirectionEnumTypeTransformer] instance.
  static SmartHookahServicesGearTobaccoFilterSortDirectionEnumTypeTransformer _instance;
}


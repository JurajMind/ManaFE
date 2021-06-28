//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Validation {
  /// Returns a new [Validation] instance.
  Validation({
    this.id,
    this.flag,
    this.success,
    this.message,
    this.httpResponseCode,
  });

  String id;

  ValidationFlagEnum flag;

  bool success;

  String message;

  int httpResponseCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Validation &&
     other.id == id &&
     other.flag == flag &&
     other.success == success &&
     other.message == message &&
     other.httpResponseCode == httpResponseCode;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (flag == null ? 0 : flag.hashCode) +
    (success == null ? 0 : success.hashCode) +
    (message == null ? 0 : message.hashCode) +
    (httpResponseCode == null ? 0 : httpResponseCode.hashCode);

  @override
  String toString() => 'Validation[id=$id, flag=$flag, success=$success, message=$message, httpResponseCode=$httpResponseCode]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'Id'] = id;
    }
    if (flag != null) {
      json[r'Flag'] = flag;
    }
    if (success != null) {
      json[r'Success'] = success;
    }
    if (message != null) {
      json[r'Message'] = message;
    }
    if (httpResponseCode != null) {
      json[r'HttpResponseCode'] = httpResponseCode;
    }
    return json;
  }

  /// Returns a new [Validation] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static Validation fromJson(Map<String, dynamic> json) => json == null
    ? null
    : Validation(
        id: json[r'Id'],
        flag: ValidationFlagEnum.fromJson(json[r'Flag']),
        success: json[r'Success'],
        message: json[r'Message'],
        httpResponseCode: json[r'HttpResponseCode'],
    );

  static List<Validation> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <Validation>[]
      : json.map((v) => Validation.fromJson(v)).toList(growable: true == growable);

  static Map<String, Validation> mapFromJson(Map<String, dynamic> json) {
    final map = <String, Validation>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = Validation.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of Validation-objects as value to a dart map
  static Map<String, List<Validation>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<Validation>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = Validation.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


class ValidationFlagEnum {
  /// Instantiate a new enum with the provided [value].
  const ValidationFlagEnum._(this.value);

  /// The underlying value of this enum member.
  final int value;

  @override
  String toString() => value.toString();

  int toJson() => value;

  static const number0 = ValidationFlagEnum._(0);
  static const number1 = ValidationFlagEnum._(1);

  /// List of all possible values in this [enum][ValidationFlagEnum].
  static const values = <ValidationFlagEnum>[
    number0,
    number1,
  ];

  static ValidationFlagEnum fromJson(dynamic value) =>
    ValidationFlagEnumTypeTransformer().decode(value);

  static List<ValidationFlagEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ValidationFlagEnum>[]
      : json
          .map((value) => ValidationFlagEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [ValidationFlagEnum] to int,
/// and [decode] dynamic data back to [ValidationFlagEnum].
class ValidationFlagEnumTypeTransformer {
  const ValidationFlagEnumTypeTransformer._();

  factory ValidationFlagEnumTypeTransformer() => _instance ??= ValidationFlagEnumTypeTransformer._();

  int encode(ValidationFlagEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ValidationFlagEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ValidationFlagEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case 0: return ValidationFlagEnum.number0;
      case 1: return ValidationFlagEnum.number1;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [ValidationFlagEnumTypeTransformer] instance.
  static ValidationFlagEnumTypeTransformer _instance;
}


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TobaccoInMix {
  /// Returns a new [TobaccoInMix] instance.
  TobaccoInMix({
    this.tobacco,
    this.fraction,
  });

  TobaccoSimpleDto tobacco;

  int fraction;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TobaccoInMix &&
     other.tobacco == tobacco &&
     other.fraction == fraction;

  @override
  int get hashCode =>
    (tobacco == null ? 0 : tobacco.hashCode) +
    (fraction == null ? 0 : fraction.hashCode);

  @override
  String toString() => 'TobaccoInMix[tobacco=$tobacco, fraction=$fraction]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (tobacco != null) {
      json[r'Tobacco'] = tobacco;
    }
    if (fraction != null) {
      json[r'Fraction'] = fraction;
    }
    return json;
  }

  /// Returns a new [TobaccoInMix] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static TobaccoInMix fromJson(Map<String, dynamic> json) => json == null
    ? null
    : TobaccoInMix(
        tobacco: TobaccoSimpleDto.fromJson(json[r'Tobacco']),
        fraction: json[r'Fraction'],
    );

  static List<TobaccoInMix> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <TobaccoInMix>[]
      : json.map((v) => TobaccoInMix.fromJson(v)).toList(growable: true == growable);

  static Map<String, TobaccoInMix> mapFromJson(Map<String, dynamic> json) {
    final map = <String, TobaccoInMix>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = TobaccoInMix.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of TobaccoInMix-objects as value to a dart map
  static Map<String, List<TobaccoInMix>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<TobaccoInMix>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = TobaccoInMix.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


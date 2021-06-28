//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InlineResponse200 {
  /// Returns a new [InlineResponse200] instance.
  InlineResponse200({
    this.bowl = const [],
    this.tobacco = const [],
    this.tobaccoMix = const [],
    this.heatmanagement = const [],
    this.hookah = const [],
    this.coal = const [],
  });

  List<BrandGroupDto> bowl;

  List<BrandGroupDto> tobacco;

  List<BrandGroupDto> tobaccoMix;

  List<BrandGroupDto> heatmanagement;

  List<BrandGroupDto> hookah;

  List<BrandGroupDto> coal;

  @override
  bool operator ==(Object other) => identical(this, other) || other is InlineResponse200 &&
     other.bowl == bowl &&
     other.tobacco == tobacco &&
     other.tobaccoMix == tobaccoMix &&
     other.heatmanagement == heatmanagement &&
     other.hookah == hookah &&
     other.coal == coal;

  @override
  int get hashCode =>
    (bowl == null ? 0 : bowl.hashCode) +
    (tobacco == null ? 0 : tobacco.hashCode) +
    (tobaccoMix == null ? 0 : tobaccoMix.hashCode) +
    (heatmanagement == null ? 0 : heatmanagement.hashCode) +
    (hookah == null ? 0 : hookah.hashCode) +
    (coal == null ? 0 : coal.hashCode);

  @override
  String toString() => 'InlineResponse200[bowl=$bowl, tobacco=$tobacco, tobaccoMix=$tobaccoMix, heatmanagement=$heatmanagement, hookah=$hookah, coal=$coal]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (bowl != null) {
      json[r'Bowl'] = bowl;
    }
    if (tobacco != null) {
      json[r'Tobacco'] = tobacco;
    }
    if (tobaccoMix != null) {
      json[r'TobaccoMix'] = tobaccoMix;
    }
    if (heatmanagement != null) {
      json[r'Heatmanagement'] = heatmanagement;
    }
    if (hookah != null) {
      json[r'Hookah'] = hookah;
    }
    if (coal != null) {
      json[r'Coal'] = coal;
    }
    return json;
  }

  /// Returns a new [InlineResponse200] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static InlineResponse200 fromJson(Map<String, dynamic> json) => json == null
    ? null
    : InlineResponse200(
        bowl: BrandGroupDto.listFromJson(json[r'Bowl']),
        tobacco: BrandGroupDto.listFromJson(json[r'Tobacco']),
        tobaccoMix: BrandGroupDto.listFromJson(json[r'TobaccoMix']),
        heatmanagement: BrandGroupDto.listFromJson(json[r'Heatmanagement']),
        hookah: BrandGroupDto.listFromJson(json[r'Hookah']),
        coal: BrandGroupDto.listFromJson(json[r'Coal']),
    );

  static List<InlineResponse200> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <InlineResponse200>[]
      : json.map((v) => InlineResponse200.fromJson(v)).toList(growable: true == growable);

  static Map<String, InlineResponse200> mapFromJson(Map<String, dynamic> json) {
    final map = <String, InlineResponse200>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = InlineResponse200.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of InlineResponse200-objects as value to a dart map
  static Map<String, List<InlineResponse200>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<InlineResponse200>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = InlineResponse200.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


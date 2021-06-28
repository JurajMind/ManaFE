//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FranchiseDto {
  /// Returns a new [FranchiseDto] instance.
  FranchiseDto({
    this.id,
    this.name,
    this.uril,
  });

  int id;

  String name;

  String uril;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FranchiseDto &&
     other.id == id &&
     other.name == name &&
     other.uril == uril;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (name == null ? 0 : name.hashCode) +
    (uril == null ? 0 : uril.hashCode);

  @override
  String toString() => 'FranchiseDto[id=$id, name=$name, uril=$uril]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'Id'] = id;
    }
    if (name != null) {
      json[r'Name'] = name;
    }
    if (uril != null) {
      json[r'Uril'] = uril;
    }
    return json;
  }

  /// Returns a new [FranchiseDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static FranchiseDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : FranchiseDto(
        id: json[r'Id'],
        name: json[r'Name'],
        uril: json[r'Uril'],
    );

  static List<FranchiseDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <FranchiseDto>[]
      : json.map((v) => FranchiseDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, FranchiseDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, FranchiseDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = FranchiseDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of FranchiseDto-objects as value to a dart map
  static Map<String, List<FranchiseDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<FranchiseDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = FranchiseDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BrandGroupDto {
  /// Returns a new [BrandGroupDto] instance.
  BrandGroupDto({
    this.id,
    this.picture,
    this.name,
    this.itemCount,
  });

  String id;

  String picture;

  String name;

  int itemCount;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BrandGroupDto &&
     other.id == id &&
     other.picture == picture &&
     other.name == name &&
     other.itemCount == itemCount;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (picture == null ? 0 : picture.hashCode) +
    (name == null ? 0 : name.hashCode) +
    (itemCount == null ? 0 : itemCount.hashCode);

  @override
  String toString() => 'BrandGroupDto[id=$id, picture=$picture, name=$name, itemCount=$itemCount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'Id'] = id;
    }
    if (picture != null) {
      json[r'Picture'] = picture;
    }
    if (name != null) {
      json[r'Name'] = name;
    }
    if (itemCount != null) {
      json[r'ItemCount'] = itemCount;
    }
    return json;
  }

  /// Returns a new [BrandGroupDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static BrandGroupDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : BrandGroupDto(
        id: json[r'Id'],
        picture: json[r'Picture'],
        name: json[r'Name'],
        itemCount: json[r'ItemCount'],
    );

  static List<BrandGroupDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <BrandGroupDto>[]
      : json.map((v) => BrandGroupDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, BrandGroupDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, BrandGroupDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = BrandGroupDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of BrandGroupDto-objects as value to a dart map
  static Map<String, List<BrandGroupDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<BrandGroupDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = BrandGroupDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


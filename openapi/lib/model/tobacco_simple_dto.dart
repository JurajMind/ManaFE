//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TobaccoSimpleDto {
  /// Returns a new [TobaccoSimpleDto] instance.
  TobaccoSimpleDto({
    this.likes = const [],
    this.id,
    this.name,
    this.brand,
    this.brandId,
    this.picture,
    this.type,
    this.likeCount,
    this.disLikeCount,
  });

  List<PipeAccesoryLikeDto> likes;

  int id;

  String name;

  String brand;

  String brandId;

  String picture;

  String type;

  int likeCount;

  int disLikeCount;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TobaccoSimpleDto &&
     other.likes == likes &&
     other.id == id &&
     other.name == name &&
     other.brand == brand &&
     other.brandId == brandId &&
     other.picture == picture &&
     other.type == type &&
     other.likeCount == likeCount &&
     other.disLikeCount == disLikeCount;

  @override
  int get hashCode =>
    (likes == null ? 0 : likes.hashCode) +
    (id == null ? 0 : id.hashCode) +
    (name == null ? 0 : name.hashCode) +
    (brand == null ? 0 : brand.hashCode) +
    (brandId == null ? 0 : brandId.hashCode) +
    (picture == null ? 0 : picture.hashCode) +
    (type == null ? 0 : type.hashCode) +
    (likeCount == null ? 0 : likeCount.hashCode) +
    (disLikeCount == null ? 0 : disLikeCount.hashCode);

  @override
  String toString() => 'TobaccoSimpleDto[likes=$likes, id=$id, name=$name, brand=$brand, brandId=$brandId, picture=$picture, type=$type, likeCount=$likeCount, disLikeCount=$disLikeCount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (likes != null) {
      json[r'Likes'] = likes;
    }
    if (id != null) {
      json[r'Id'] = id;
    }
    if (name != null) {
      json[r'Name'] = name;
    }
    if (brand != null) {
      json[r'Brand'] = brand;
    }
    if (brandId != null) {
      json[r'BrandId'] = brandId;
    }
    if (picture != null) {
      json[r'Picture'] = picture;
    }
    if (type != null) {
      json[r'Type'] = type;
    }
    if (likeCount != null) {
      json[r'LikeCount'] = likeCount;
    }
    if (disLikeCount != null) {
      json[r'DisLikeCount'] = disLikeCount;
    }
    return json;
  }

  /// Returns a new [TobaccoSimpleDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static TobaccoSimpleDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : TobaccoSimpleDto(
        likes: PipeAccesoryLikeDto.listFromJson(json[r'Likes']),
        id: json[r'Id'],
        name: json[r'Name'],
        brand: json[r'Brand'],
        brandId: json[r'BrandId'],
        picture: json[r'Picture'],
        type: json[r'Type'],
        likeCount: json[r'LikeCount'],
        disLikeCount: json[r'DisLikeCount'],
    );

  static List<TobaccoSimpleDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <TobaccoSimpleDto>[]
      : json.map((v) => TobaccoSimpleDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, TobaccoSimpleDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, TobaccoSimpleDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = TobaccoSimpleDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of TobaccoSimpleDto-objects as value to a dart map
  static Map<String, List<TobaccoSimpleDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<TobaccoSimpleDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = TobaccoSimpleDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


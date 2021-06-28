//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TobaccoMixSimpleDto {
  /// Returns a new [TobaccoMixSimpleDto] instance.
  TobaccoMixSimpleDto({
    this.likes = const [],
    this.tobaccos = const [],
    this.myMix,
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

  List<TobaccoInMix> tobaccos;

  bool myMix;

  int id;

  String name;

  String brand;

  String brandId;

  String picture;

  String type;

  int likeCount;

  int disLikeCount;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TobaccoMixSimpleDto &&
     other.likes == likes &&
     other.tobaccos == tobaccos &&
     other.myMix == myMix &&
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
    (tobaccos == null ? 0 : tobaccos.hashCode) +
    (myMix == null ? 0 : myMix.hashCode) +
    (id == null ? 0 : id.hashCode) +
    (name == null ? 0 : name.hashCode) +
    (brand == null ? 0 : brand.hashCode) +
    (brandId == null ? 0 : brandId.hashCode) +
    (picture == null ? 0 : picture.hashCode) +
    (type == null ? 0 : type.hashCode) +
    (likeCount == null ? 0 : likeCount.hashCode) +
    (disLikeCount == null ? 0 : disLikeCount.hashCode);

  @override
  String toString() => 'TobaccoMixSimpleDto[likes=$likes, tobaccos=$tobaccos, myMix=$myMix, id=$id, name=$name, brand=$brand, brandId=$brandId, picture=$picture, type=$type, likeCount=$likeCount, disLikeCount=$disLikeCount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (likes != null) {
      json[r'Likes'] = likes;
    }
    if (tobaccos != null) {
      json[r'Tobaccos'] = tobaccos;
    }
    if (myMix != null) {
      json[r'MyMix'] = myMix;
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

  /// Returns a new [TobaccoMixSimpleDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static TobaccoMixSimpleDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : TobaccoMixSimpleDto(
        likes: PipeAccesoryLikeDto.listFromJson(json[r'Likes']),
        tobaccos: TobaccoInMix.listFromJson(json[r'Tobaccos']),
        myMix: json[r'MyMix'],
        id: json[r'Id'],
        name: json[r'Name'],
        brand: json[r'Brand'],
        brandId: json[r'BrandId'],
        picture: json[r'Picture'],
        type: json[r'Type'],
        likeCount: json[r'LikeCount'],
        disLikeCount: json[r'DisLikeCount'],
    );

  static List<TobaccoMixSimpleDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <TobaccoMixSimpleDto>[]
      : json.map((v) => TobaccoMixSimpleDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, TobaccoMixSimpleDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, TobaccoMixSimpleDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = TobaccoMixSimpleDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of TobaccoMixSimpleDto-objects as value to a dart map
  static Map<String, List<TobaccoMixSimpleDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<TobaccoMixSimpleDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = TobaccoMixSimpleDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


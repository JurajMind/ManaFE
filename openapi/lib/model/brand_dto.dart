//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BrandDto {
  /// Returns a new [BrandDto] instance.
  BrandDto({
    this.name,
    this.url,
    this.picture,
    this.tobacco,
    this.bowl,
    this.hookah,
    this.coal,
    this.heatManagment,
    this.tobaccoMixBrand,
    this.pipeAccessories = const [],
    this.socialMedias = const [],
    this.medias = const [],
    this.displayName,
  });

  String name;

  String url;

  String picture;

  bool tobacco;

  bool bowl;

  bool hookah;

  bool coal;

  bool heatManagment;

  bool tobaccoMixBrand;

  List<PipeAccesorySimpleDto> pipeAccessories;

  List<SmartHookahModelsDbSocialMedia> socialMedias;

  List<MediaDto> medias;

  String displayName;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BrandDto &&
     other.name == name &&
     other.url == url &&
     other.picture == picture &&
     other.tobacco == tobacco &&
     other.bowl == bowl &&
     other.hookah == hookah &&
     other.coal == coal &&
     other.heatManagment == heatManagment &&
     other.tobaccoMixBrand == tobaccoMixBrand &&
     other.pipeAccessories == pipeAccessories &&
     other.socialMedias == socialMedias &&
     other.medias == medias &&
     other.displayName == displayName;

  @override
  int get hashCode =>
    (name == null ? 0 : name.hashCode) +
    (url == null ? 0 : url.hashCode) +
    (picture == null ? 0 : picture.hashCode) +
    (tobacco == null ? 0 : tobacco.hashCode) +
    (bowl == null ? 0 : bowl.hashCode) +
    (hookah == null ? 0 : hookah.hashCode) +
    (coal == null ? 0 : coal.hashCode) +
    (heatManagment == null ? 0 : heatManagment.hashCode) +
    (tobaccoMixBrand == null ? 0 : tobaccoMixBrand.hashCode) +
    (pipeAccessories == null ? 0 : pipeAccessories.hashCode) +
    (socialMedias == null ? 0 : socialMedias.hashCode) +
    (medias == null ? 0 : medias.hashCode) +
    (displayName == null ? 0 : displayName.hashCode);

  @override
  String toString() => 'BrandDto[name=$name, url=$url, picture=$picture, tobacco=$tobacco, bowl=$bowl, hookah=$hookah, coal=$coal, heatManagment=$heatManagment, tobaccoMixBrand=$tobaccoMixBrand, pipeAccessories=$pipeAccessories, socialMedias=$socialMedias, medias=$medias, displayName=$displayName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (name != null) {
      json[r'Name'] = name;
    }
    if (url != null) {
      json[r'Url'] = url;
    }
    if (picture != null) {
      json[r'Picture'] = picture;
    }
    if (tobacco != null) {
      json[r'Tobacco'] = tobacco;
    }
    if (bowl != null) {
      json[r'Bowl'] = bowl;
    }
    if (hookah != null) {
      json[r'Hookah'] = hookah;
    }
    if (coal != null) {
      json[r'Coal'] = coal;
    }
    if (heatManagment != null) {
      json[r'HeatManagment'] = heatManagment;
    }
    if (tobaccoMixBrand != null) {
      json[r'TobaccoMixBrand'] = tobaccoMixBrand;
    }
    if (pipeAccessories != null) {
      json[r'PipeAccessories'] = pipeAccessories;
    }
    if (socialMedias != null) {
      json[r'SocialMedias'] = socialMedias;
    }
    if (medias != null) {
      json[r'Medias'] = medias;
    }
    if (displayName != null) {
      json[r'DisplayName'] = displayName;
    }
    return json;
  }

  /// Returns a new [BrandDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static BrandDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : BrandDto(
        name: json[r'Name'],
        url: json[r'Url'],
        picture: json[r'Picture'],
        tobacco: json[r'Tobacco'],
        bowl: json[r'Bowl'],
        hookah: json[r'Hookah'],
        coal: json[r'Coal'],
        heatManagment: json[r'HeatManagment'],
        tobaccoMixBrand: json[r'TobaccoMixBrand'],
        pipeAccessories: PipeAccesorySimpleDto.listFromJson(json[r'PipeAccessories']),
        socialMedias: SmartHookahModelsDbSocialMedia.listFromJson(json[r'SocialMedias']),
        medias: MediaDto.listFromJson(json[r'Medias']),
        displayName: json[r'DisplayName'],
    );

  static List<BrandDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <BrandDto>[]
      : json.map((v) => BrandDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, BrandDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, BrandDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = BrandDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of BrandDto-objects as value to a dart map
  static Map<String, List<BrandDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<BrandDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = BrandDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


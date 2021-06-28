//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FeatureMixCreatorDto {
  /// Returns a new [FeatureMixCreatorDto] instance.
  FeatureMixCreatorDto({
    this.name,
    this.description,
    this.location,
    this.socialMedias = const [],
    this.medias = const [],
    this.logoPicture,
    this.personId,
    this.id,
  });

  String name;

  String description;

  String location;

  List<SmartHookahModelsDbSocialMedia> socialMedias;

  List<MediaDto> medias;

  String logoPicture;

  int personId;

  int id;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FeatureMixCreatorDto &&
     other.name == name &&
     other.description == description &&
     other.location == location &&
     other.socialMedias == socialMedias &&
     other.medias == medias &&
     other.logoPicture == logoPicture &&
     other.personId == personId &&
     other.id == id;

  @override
  int get hashCode =>
    (name == null ? 0 : name.hashCode) +
    (description == null ? 0 : description.hashCode) +
    (location == null ? 0 : location.hashCode) +
    (socialMedias == null ? 0 : socialMedias.hashCode) +
    (medias == null ? 0 : medias.hashCode) +
    (logoPicture == null ? 0 : logoPicture.hashCode) +
    (personId == null ? 0 : personId.hashCode) +
    (id == null ? 0 : id.hashCode);

  @override
  String toString() => 'FeatureMixCreatorDto[name=$name, description=$description, location=$location, socialMedias=$socialMedias, medias=$medias, logoPicture=$logoPicture, personId=$personId, id=$id]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (name != null) {
      json[r'Name'] = name;
    }
    if (description != null) {
      json[r'Description'] = description;
    }
    if (location != null) {
      json[r'Location'] = location;
    }
    if (socialMedias != null) {
      json[r'SocialMedias'] = socialMedias;
    }
    if (medias != null) {
      json[r'Medias'] = medias;
    }
    if (logoPicture != null) {
      json[r'LogoPicture'] = logoPicture;
    }
    if (personId != null) {
      json[r'PersonId'] = personId;
    }
    if (id != null) {
      json[r'Id'] = id;
    }
    return json;
  }

  /// Returns a new [FeatureMixCreatorDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static FeatureMixCreatorDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : FeatureMixCreatorDto(
        name: json[r'Name'],
        description: json[r'Description'],
        location: json[r'Location'],
        socialMedias: SmartHookahModelsDbSocialMedia.listFromJson(json[r'SocialMedias']),
        medias: MediaDto.listFromJson(json[r'Medias']),
        logoPicture: json[r'LogoPicture'],
        personId: json[r'PersonId'],
        id: json[r'Id'],
    );

  static List<FeatureMixCreatorDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <FeatureMixCreatorDto>[]
      : json.map((v) => FeatureMixCreatorDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, FeatureMixCreatorDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, FeatureMixCreatorDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = FeatureMixCreatorDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of FeatureMixCreatorDto-objects as value to a dart map
  static Map<String, List<FeatureMixCreatorDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<FeatureMixCreatorDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = FeatureMixCreatorDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


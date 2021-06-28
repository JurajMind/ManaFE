//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FeatureMixCreatorSimpleDto {
  /// Returns a new [FeatureMixCreatorSimpleDto] instance.
  FeatureMixCreatorSimpleDto({
    this.name,
    this.description,
    this.location,
    this.logoPicture,
    this.personId,
    this.id,
  });

  String name;

  String description;

  String location;

  String logoPicture;

  int personId;

  int id;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FeatureMixCreatorSimpleDto &&
     other.name == name &&
     other.description == description &&
     other.location == location &&
     other.logoPicture == logoPicture &&
     other.personId == personId &&
     other.id == id;

  @override
  int get hashCode =>
    (name == null ? 0 : name.hashCode) +
    (description == null ? 0 : description.hashCode) +
    (location == null ? 0 : location.hashCode) +
    (logoPicture == null ? 0 : logoPicture.hashCode) +
    (personId == null ? 0 : personId.hashCode) +
    (id == null ? 0 : id.hashCode);

  @override
  String toString() => 'FeatureMixCreatorSimpleDto[name=$name, description=$description, location=$location, logoPicture=$logoPicture, personId=$personId, id=$id]';

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

  /// Returns a new [FeatureMixCreatorSimpleDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static FeatureMixCreatorSimpleDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : FeatureMixCreatorSimpleDto(
        name: json[r'Name'],
        description: json[r'Description'],
        location: json[r'Location'],
        logoPicture: json[r'LogoPicture'],
        personId: json[r'PersonId'],
        id: json[r'Id'],
    );

  static List<FeatureMixCreatorSimpleDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <FeatureMixCreatorSimpleDto>[]
      : json.map((v) => FeatureMixCreatorSimpleDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, FeatureMixCreatorSimpleDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, FeatureMixCreatorSimpleDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = FeatureMixCreatorSimpleDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of FeatureMixCreatorSimpleDto-objects as value to a dart map
  static Map<String, List<FeatureMixCreatorSimpleDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<FeatureMixCreatorSimpleDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = FeatureMixCreatorSimpleDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


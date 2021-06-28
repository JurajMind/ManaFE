//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PersonInfoDto {
  /// Returns a new [PersonInfoDto] instance.
  PersonInfoDto({
    this.displayName,
    this.email,
    this.managedPlaces = const [],
    this.roles = const [],
    this.personId,
  });

  String displayName;

  String email;

  List<PlaceSimpleDto> managedPlaces;

  List<String> roles;

  int personId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PersonInfoDto &&
     other.displayName == displayName &&
     other.email == email &&
     other.managedPlaces == managedPlaces &&
     other.roles == roles &&
     other.personId == personId;

  @override
  int get hashCode =>
    (displayName == null ? 0 : displayName.hashCode) +
    (email == null ? 0 : email.hashCode) +
    (managedPlaces == null ? 0 : managedPlaces.hashCode) +
    (roles == null ? 0 : roles.hashCode) +
    (personId == null ? 0 : personId.hashCode);

  @override
  String toString() => 'PersonInfoDto[displayName=$displayName, email=$email, managedPlaces=$managedPlaces, roles=$roles, personId=$personId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (displayName != null) {
      json[r'DisplayName'] = displayName;
    }
    if (email != null) {
      json[r'Email'] = email;
    }
    if (managedPlaces != null) {
      json[r'ManagedPlaces'] = managedPlaces;
    }
    if (roles != null) {
      json[r'Roles'] = roles;
    }
    if (personId != null) {
      json[r'PersonId'] = personId;
    }
    return json;
  }

  /// Returns a new [PersonInfoDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static PersonInfoDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : PersonInfoDto(
        displayName: json[r'DisplayName'],
        email: json[r'Email'],
        managedPlaces: PlaceSimpleDto.listFromJson(json[r'ManagedPlaces']),
        roles: json[r'Roles'] == null
          ? null
          : (json[r'Roles'] as List).cast<String>(),
        personId: json[r'PersonId'],
    );

  static List<PersonInfoDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <PersonInfoDto>[]
      : json.map((v) => PersonInfoDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, PersonInfoDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, PersonInfoDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = PersonInfoDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of PersonInfoDto-objects as value to a dart map
  static Map<String, List<PersonInfoDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<PersonInfoDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = PersonInfoDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


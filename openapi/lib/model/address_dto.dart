//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AddressDto {
  /// Returns a new [AddressDto] instance.
  AddressDto({
    this.id,
    this.street,
    this.city,
    this.number,
    this.ZIP,
    this.lat,
    this.lng,
  });

  int id;

  String street;

  String city;

  String number;

  String ZIP;

  String lat;

  String lng;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AddressDto &&
     other.id == id &&
     other.street == street &&
     other.city == city &&
     other.number == number &&
     other.ZIP == ZIP &&
     other.lat == lat &&
     other.lng == lng;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (street == null ? 0 : street.hashCode) +
    (city == null ? 0 : city.hashCode) +
    (number == null ? 0 : number.hashCode) +
    (ZIP == null ? 0 : ZIP.hashCode) +
    (lat == null ? 0 : lat.hashCode) +
    (lng == null ? 0 : lng.hashCode);

  @override
  String toString() => 'AddressDto[id=$id, street=$street, city=$city, number=$number, ZIP=$ZIP, lat=$lat, lng=$lng]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'Id'] = id;
    }
    if (street != null) {
      json[r'Street'] = street;
    }
    if (city != null) {
      json[r'City'] = city;
    }
    if (number != null) {
      json[r'Number'] = number;
    }
    if (ZIP != null) {
      json[r'ZIP'] = ZIP;
    }
    if (lat != null) {
      json[r'Lat'] = lat;
    }
    if (lng != null) {
      json[r'Lng'] = lng;
    }
    return json;
  }

  /// Returns a new [AddressDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static AddressDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : AddressDto(
        id: json[r'Id'],
        street: json[r'Street'],
        city: json[r'City'],
        number: json[r'Number'],
        ZIP: json[r'ZIP'],
        lat: json[r'Lat'],
        lng: json[r'Lng'],
    );

  static List<AddressDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <AddressDto>[]
      : json.map((v) => AddressDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, AddressDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, AddressDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = AddressDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of AddressDto-objects as value to a dart map
  static Map<String, List<AddressDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<AddressDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = AddressDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


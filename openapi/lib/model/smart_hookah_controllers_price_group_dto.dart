//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SmartHookahControllersPriceGroupDto {
  /// Returns a new [SmartHookahControllersPriceGroupDto] instance.
  SmartHookahControllersPriceGroupDto({
    this.id,
    this.name,
    this.price,
  });

  int id;

  String name;

  double price;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahControllersPriceGroupDto &&
     other.id == id &&
     other.name == name &&
     other.price == price;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (name == null ? 0 : name.hashCode) +
    (price == null ? 0 : price.hashCode);

  @override
  String toString() => 'SmartHookahControllersPriceGroupDto[id=$id, name=$name, price=$price]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'Id'] = id;
    }
    if (name != null) {
      json[r'Name'] = name;
    }
    if (price != null) {
      json[r'Price'] = price;
    }
    return json;
  }

  /// Returns a new [SmartHookahControllersPriceGroupDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static SmartHookahControllersPriceGroupDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : SmartHookahControllersPriceGroupDto(
        id: json[r'Id'],
        name: json[r'Name'],
        price: json[r'Price'],
    );

  static List<SmartHookahControllersPriceGroupDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmartHookahControllersPriceGroupDto>[]
      : json.map((v) => SmartHookahControllersPriceGroupDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, SmartHookahControllersPriceGroupDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, SmartHookahControllersPriceGroupDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = SmartHookahControllersPriceGroupDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of SmartHookahControllersPriceGroupDto-objects as value to a dart map
  static Map<String, List<SmartHookahControllersPriceGroupDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<SmartHookahControllersPriceGroupDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = SmartHookahControllersPriceGroupDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


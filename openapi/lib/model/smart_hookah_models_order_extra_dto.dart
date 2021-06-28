//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SmartHookahModelsOrderExtraDto {
  /// Returns a new [SmartHookahModelsOrderExtraDto] instance.
  SmartHookahModelsOrderExtraDto({
    this.id,
    this.currency,
    this.price,
    this.name,
  });

  int id;

  String currency;

  double price;

  String name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahModelsOrderExtraDto &&
     other.id == id &&
     other.currency == currency &&
     other.price == price &&
     other.name == name;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (currency == null ? 0 : currency.hashCode) +
    (price == null ? 0 : price.hashCode) +
    (name == null ? 0 : name.hashCode);

  @override
  String toString() => 'SmartHookahModelsOrderExtraDto[id=$id, currency=$currency, price=$price, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'Id'] = id;
    }
    if (currency != null) {
      json[r'Currency'] = currency;
    }
    if (price != null) {
      json[r'Price'] = price;
    }
    if (name != null) {
      json[r'Name'] = name;
    }
    return json;
  }

  /// Returns a new [SmartHookahModelsOrderExtraDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static SmartHookahModelsOrderExtraDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : SmartHookahModelsOrderExtraDto(
        id: json[r'Id'],
        currency: json[r'Currency'],
        price: json[r'Price'],
        name: json[r'Name'],
    );

  static List<SmartHookahModelsOrderExtraDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmartHookahModelsOrderExtraDto>[]
      : json.map((v) => SmartHookahModelsOrderExtraDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, SmartHookahModelsOrderExtraDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, SmartHookahModelsOrderExtraDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = SmartHookahModelsOrderExtraDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of SmartHookahModelsOrderExtraDto-objects as value to a dart map
  static Map<String, List<SmartHookahModelsOrderExtraDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<SmartHookahModelsOrderExtraDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = SmartHookahModelsOrderExtraDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


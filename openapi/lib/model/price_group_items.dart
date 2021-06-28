//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PriceGroupItems {
  /// Returns a new [PriceGroupItems] instance.
  PriceGroupItems({
    this.groupId,
    this.price = const {},
  });

  int groupId;

  Map<String, double> price;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PriceGroupItems &&
     other.groupId == groupId &&
     other.price == price;

  @override
  int get hashCode =>
    (groupId == null ? 0 : groupId.hashCode) +
    (price == null ? 0 : price.hashCode);

  @override
  String toString() => 'PriceGroupItems[groupId=$groupId, price=$price]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (groupId != null) {
      json[r'GroupId'] = groupId;
    }
    if (price != null) {
      json[r'Price'] = price;
    }
    return json;
  }

  /// Returns a new [PriceGroupItems] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static PriceGroupItems fromJson(Map<String, dynamic> json) => json == null
    ? null
    : PriceGroupItems(
        groupId: json[r'GroupId'],
        price: json[r'Price'] == null ?
          null :
          (json[r'Price'] as Map).cast<String, double>(),
    );

  static List<PriceGroupItems> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <PriceGroupItems>[]
      : json.map((v) => PriceGroupItems.fromJson(v)).toList(growable: true == growable);

  static Map<String, PriceGroupItems> mapFromJson(Map<String, dynamic> json) {
    final map = <String, PriceGroupItems>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = PriceGroupItems.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of PriceGroupItems-objects as value to a dart map
  static Map<String, List<PriceGroupItems>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<PriceGroupItems>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = PriceGroupItems.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


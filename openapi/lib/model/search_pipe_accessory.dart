//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SearchPipeAccessory {
  /// Returns a new [SearchPipeAccessory] instance.
  SearchPipeAccessory({
    this.id,
    this.name,
    this.brand,
    this.type,
    this.nonVerified,
  });

  int id;

  String name;

  String brand;

  String type;

  bool nonVerified;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SearchPipeAccessory &&
     other.id == id &&
     other.name == name &&
     other.brand == brand &&
     other.type == type &&
     other.nonVerified == nonVerified;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (name == null ? 0 : name.hashCode) +
    (brand == null ? 0 : brand.hashCode) +
    (type == null ? 0 : type.hashCode) +
    (nonVerified == null ? 0 : nonVerified.hashCode);

  @override
  String toString() => 'SearchPipeAccessory[id=$id, name=$name, brand=$brand, type=$type, nonVerified=$nonVerified]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'Id'] = id;
    }
    if (name != null) {
      json[r'Name'] = name;
    }
    if (brand != null) {
      json[r'Brand'] = brand;
    }
    if (type != null) {
      json[r'Type'] = type;
    }
    if (nonVerified != null) {
      json[r'NonVerified'] = nonVerified;
    }
    return json;
  }

  /// Returns a new [SearchPipeAccessory] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static SearchPipeAccessory fromJson(Map<String, dynamic> json) => json == null
    ? null
    : SearchPipeAccessory(
        id: json[r'Id'],
        name: json[r'Name'],
        brand: json[r'Brand'],
        type: json[r'Type'],
        nonVerified: json[r'NonVerified'],
    );

  static List<SearchPipeAccessory> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SearchPipeAccessory>[]
      : json.map((v) => SearchPipeAccessory.fromJson(v)).toList(growable: true == growable);

  static Map<String, SearchPipeAccessory> mapFromJson(Map<String, dynamic> json) {
    final map = <String, SearchPipeAccessory>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = SearchPipeAccessory.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of SearchPipeAccessory-objects as value to a dart map
  static Map<String, List<SearchPipeAccessory>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<SearchPipeAccessory>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = SearchPipeAccessory.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


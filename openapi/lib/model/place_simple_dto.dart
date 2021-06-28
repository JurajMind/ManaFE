//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PlaceSimpleDto {
  /// Returns a new [PlaceSimpleDto] instance.
  PlaceSimpleDto({
    this.id,
    this.name,
    this.shortDescriptions = const {},
    this.description = const {},
    this.franchiseId,
    this.franchiseName,
    this.franchiseLogo,
    this.friendlyUrl,
    this.logoPath,
    this.address,
    this.businessHours = const [],
    this.rating,
    this.media,
    this.phoneNumber,
    this.facebook,
    this.haveMenu,
    this.haveOrders,
    this.haveMana,
    this.haveReservation,
  });

  int id;

  String name;

  Map<String, String> shortDescriptions;

  Map<String, String> description;

  int franchiseId;

  String franchiseName;

  String franchiseLogo;

  String friendlyUrl;

  String logoPath;

  AddressDto address;

  List<BusinessHoursDto> businessHours;

  int rating;

  MediaDto media;

  String phoneNumber;

  String facebook;

  bool haveMenu;

  bool haveOrders;

  bool haveMana;

  bool haveReservation;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PlaceSimpleDto &&
     other.id == id &&
     other.name == name &&
     other.shortDescriptions == shortDescriptions &&
     other.description == description &&
     other.franchiseId == franchiseId &&
     other.franchiseName == franchiseName &&
     other.franchiseLogo == franchiseLogo &&
     other.friendlyUrl == friendlyUrl &&
     other.logoPath == logoPath &&
     other.address == address &&
     other.businessHours == businessHours &&
     other.rating == rating &&
     other.media == media &&
     other.phoneNumber == phoneNumber &&
     other.facebook == facebook &&
     other.haveMenu == haveMenu &&
     other.haveOrders == haveOrders &&
     other.haveMana == haveMana &&
     other.haveReservation == haveReservation;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (name == null ? 0 : name.hashCode) +
    (shortDescriptions == null ? 0 : shortDescriptions.hashCode) +
    (description == null ? 0 : description.hashCode) +
    (franchiseId == null ? 0 : franchiseId.hashCode) +
    (franchiseName == null ? 0 : franchiseName.hashCode) +
    (franchiseLogo == null ? 0 : franchiseLogo.hashCode) +
    (friendlyUrl == null ? 0 : friendlyUrl.hashCode) +
    (logoPath == null ? 0 : logoPath.hashCode) +
    (address == null ? 0 : address.hashCode) +
    (businessHours == null ? 0 : businessHours.hashCode) +
    (rating == null ? 0 : rating.hashCode) +
    (media == null ? 0 : media.hashCode) +
    (phoneNumber == null ? 0 : phoneNumber.hashCode) +
    (facebook == null ? 0 : facebook.hashCode) +
    (haveMenu == null ? 0 : haveMenu.hashCode) +
    (haveOrders == null ? 0 : haveOrders.hashCode) +
    (haveMana == null ? 0 : haveMana.hashCode) +
    (haveReservation == null ? 0 : haveReservation.hashCode);

  @override
  String toString() => 'PlaceSimpleDto[id=$id, name=$name, shortDescriptions=$shortDescriptions, description=$description, franchiseId=$franchiseId, franchiseName=$franchiseName, franchiseLogo=$franchiseLogo, friendlyUrl=$friendlyUrl, logoPath=$logoPath, address=$address, businessHours=$businessHours, rating=$rating, media=$media, phoneNumber=$phoneNumber, facebook=$facebook, haveMenu=$haveMenu, haveOrders=$haveOrders, haveMana=$haveMana, haveReservation=$haveReservation]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'Id'] = id;
    }
    if (name != null) {
      json[r'Name'] = name;
    }
    if (shortDescriptions != null) {
      json[r'ShortDescriptions'] = shortDescriptions;
    }
    if (description != null) {
      json[r'Description'] = description;
    }
    if (franchiseId != null) {
      json[r'FranchiseId'] = franchiseId;
    }
    if (franchiseName != null) {
      json[r'FranchiseName'] = franchiseName;
    }
    if (franchiseLogo != null) {
      json[r'FranchiseLogo'] = franchiseLogo;
    }
    if (friendlyUrl != null) {
      json[r'FriendlyUrl'] = friendlyUrl;
    }
    if (logoPath != null) {
      json[r'LogoPath'] = logoPath;
    }
    if (address != null) {
      json[r'Address'] = address;
    }
    if (businessHours != null) {
      json[r'BusinessHours'] = businessHours;
    }
    if (rating != null) {
      json[r'Rating'] = rating;
    }
    if (media != null) {
      json[r'Media'] = media;
    }
    if (phoneNumber != null) {
      json[r'PhoneNumber'] = phoneNumber;
    }
    if (facebook != null) {
      json[r'Facebook'] = facebook;
    }
    if (haveMenu != null) {
      json[r'HaveMenu'] = haveMenu;
    }
    if (haveOrders != null) {
      json[r'HaveOrders'] = haveOrders;
    }
    if (haveMana != null) {
      json[r'HaveMana'] = haveMana;
    }
    if (haveReservation != null) {
      json[r'HaveReservation'] = haveReservation;
    }
    return json;
  }

  /// Returns a new [PlaceSimpleDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static PlaceSimpleDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : PlaceSimpleDto(
        id: json[r'Id'],
        name: json[r'Name'],
        shortDescriptions: json[r'ShortDescriptions'] == null ?
          null :
          (json[r'ShortDescriptions'] as Map).cast<String, String>(),
        description: json[r'Description'] == null ?
          null :
          (json[r'Description'] as Map).cast<String, String>(),
        franchiseId: json[r'FranchiseId'],
        franchiseName: json[r'FranchiseName'],
        franchiseLogo: json[r'FranchiseLogo'],
        friendlyUrl: json[r'FriendlyUrl'],
        logoPath: json[r'LogoPath'],
        address: AddressDto.fromJson(json[r'Address']),
        businessHours: BusinessHoursDto.listFromJson(json[r'BusinessHours']),
        rating: json[r'Rating'],
        media: MediaDto.fromJson(json[r'Media']),
        phoneNumber: json[r'PhoneNumber'],
        facebook: json[r'Facebook'],
        haveMenu: json[r'HaveMenu'],
        haveOrders: json[r'HaveOrders'],
        haveMana: json[r'HaveMana'],
        haveReservation: json[r'HaveReservation'],
    );

  static List<PlaceSimpleDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <PlaceSimpleDto>[]
      : json.map((v) => PlaceSimpleDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, PlaceSimpleDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, PlaceSimpleDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = PlaceSimpleDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of PlaceSimpleDto-objects as value to a dart map
  static Map<String, List<PlaceSimpleDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<PlaceSimpleDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = PlaceSimpleDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PlaceDto {
  /// Returns a new [PlaceDto] instance.
  PlaceDto({
    this.url,
    this.descriptions,
    this.baseHookahPrice,
    this.currency,
    this.seats = const [],
    this.placeReviews = const [],
    this.medias = const [],
    this.haveReservation,
    this.minimumReservationTime,
    this.franchiseId,
    this.franchise,
    this.flags = const [],
    this.socialMedias = const [],
    this.id,
    this.name,
    this.shortDescriptions = const {},
    this.description = const {},
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
  });

  String url;

  String descriptions;

  double baseHookahPrice;

  String currency;

  List<SeatDto> seats;

  List<PlacesPlaceReviewDto> placeReviews;

  List<MediaDto> medias;

  bool haveReservation;

  int minimumReservationTime;

  int franchiseId;

  FranchiseDto franchise;

  List<String> flags;

  List<SmartHookahModelsDbSocialMedia> socialMedias;

  int id;

  String name;

  Map<String, String> shortDescriptions;

  Map<String, String> description;

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

  @override
  bool operator ==(Object other) => identical(this, other) || other is PlaceDto &&
     other.url == url &&
     other.descriptions == descriptions &&
     other.baseHookahPrice == baseHookahPrice &&
     other.currency == currency &&
     other.seats == seats &&
     other.placeReviews == placeReviews &&
     other.medias == medias &&
     other.haveReservation == haveReservation &&
     other.minimumReservationTime == minimumReservationTime &&
     other.franchiseId == franchiseId &&
     other.franchise == franchise &&
     other.flags == flags &&
     other.socialMedias == socialMedias &&
     other.id == id &&
     other.name == name &&
     other.shortDescriptions == shortDescriptions &&
     other.description == description &&
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
     other.haveMana == haveMana;

  @override
  int get hashCode =>
    (url == null ? 0 : url.hashCode) +
    (descriptions == null ? 0 : descriptions.hashCode) +
    (baseHookahPrice == null ? 0 : baseHookahPrice.hashCode) +
    (currency == null ? 0 : currency.hashCode) +
    (seats == null ? 0 : seats.hashCode) +
    (placeReviews == null ? 0 : placeReviews.hashCode) +
    (medias == null ? 0 : medias.hashCode) +
    (haveReservation == null ? 0 : haveReservation.hashCode) +
    (minimumReservationTime == null ? 0 : minimumReservationTime.hashCode) +
    (franchiseId == null ? 0 : franchiseId.hashCode) +
    (franchise == null ? 0 : franchise.hashCode) +
    (flags == null ? 0 : flags.hashCode) +
    (socialMedias == null ? 0 : socialMedias.hashCode) +
    (id == null ? 0 : id.hashCode) +
    (name == null ? 0 : name.hashCode) +
    (shortDescriptions == null ? 0 : shortDescriptions.hashCode) +
    (description == null ? 0 : description.hashCode) +
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
    (haveMana == null ? 0 : haveMana.hashCode);

  @override
  String toString() => 'PlaceDto[url=$url, descriptions=$descriptions, baseHookahPrice=$baseHookahPrice, currency=$currency, seats=$seats, placeReviews=$placeReviews, medias=$medias, haveReservation=$haveReservation, minimumReservationTime=$minimumReservationTime, franchiseId=$franchiseId, franchise=$franchise, flags=$flags, socialMedias=$socialMedias, id=$id, name=$name, shortDescriptions=$shortDescriptions, description=$description, franchiseName=$franchiseName, franchiseLogo=$franchiseLogo, friendlyUrl=$friendlyUrl, logoPath=$logoPath, address=$address, businessHours=$businessHours, rating=$rating, media=$media, phoneNumber=$phoneNumber, facebook=$facebook, haveMenu=$haveMenu, haveOrders=$haveOrders, haveMana=$haveMana]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (url != null) {
      json[r'Url'] = url;
    }
    if (descriptions != null) {
      json[r'Descriptions'] = descriptions;
    }
    if (baseHookahPrice != null) {
      json[r'BaseHookahPrice'] = baseHookahPrice;
    }
    if (currency != null) {
      json[r'Currency'] = currency;
    }
    if (seats != null) {
      json[r'Seats'] = seats;
    }
    if (placeReviews != null) {
      json[r'PlaceReviews'] = placeReviews;
    }
    if (medias != null) {
      json[r'Medias'] = medias;
    }
    if (haveReservation != null) {
      json[r'HaveReservation'] = haveReservation;
    }
    if (minimumReservationTime != null) {
      json[r'MinimumReservationTime'] = minimumReservationTime;
    }
    if (franchiseId != null) {
      json[r'FranchiseId'] = franchiseId;
    }
    if (franchise != null) {
      json[r'Franchise'] = franchise;
    }
    if (flags != null) {
      json[r'Flags'] = flags;
    }
    if (socialMedias != null) {
      json[r'SocialMedias'] = socialMedias;
    }
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
    return json;
  }

  /// Returns a new [PlaceDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static PlaceDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : PlaceDto(
        url: json[r'Url'],
        descriptions: json[r'Descriptions'],
        baseHookahPrice: json[r'BaseHookahPrice'],
        currency: json[r'Currency'],
        seats: SeatDto.listFromJson(json[r'Seats']),
        placeReviews: PlacesPlaceReviewDto.listFromJson(json[r'PlaceReviews']),
        medias: MediaDto.listFromJson(json[r'Medias']),
        haveReservation: json[r'HaveReservation'],
        minimumReservationTime: json[r'MinimumReservationTime'],
        franchiseId: json[r'FranchiseId'],
        franchise: FranchiseDto.fromJson(json[r'Franchise']),
        flags: json[r'Flags'] == null
          ? null
          : (json[r'Flags'] as List).cast<String>(),
        socialMedias: SmartHookahModelsDbSocialMedia.listFromJson(json[r'SocialMedias']),
        id: json[r'Id'],
        name: json[r'Name'],
        shortDescriptions: json[r'ShortDescriptions'] == null ?
          null :
          (json[r'ShortDescriptions'] as Map).cast<String, String>(),
        description: json[r'Description'] == null ?
          null :
          (json[r'Description'] as Map).cast<String, String>(),
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
    );

  static List<PlaceDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <PlaceDto>[]
      : json.map((v) => PlaceDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, PlaceDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, PlaceDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = PlaceDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of PlaceDto-objects as value to a dart map
  static Map<String, List<PlaceDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<PlaceDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = PlaceDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


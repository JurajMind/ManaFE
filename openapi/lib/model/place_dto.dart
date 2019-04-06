part of openapi.api;

class PlaceDto {
  String instagram = null;

  String url = null;

  String descriptions = null;

  double baseHookahPrice = null;

  String currency = null;

  List<SeatDto> seats = [];

  List<TobaccoReviewDto> tobaccoReviews = [];

  List<MediaDto> medias = [];

  bool haveReservation = null;

  int minimumReservationTime = null;

  int franchiseId = null;

  FranchiseDto franchise = null;

  List<String> flags = [];

  int id = null;

  String name = null;

  String shortDescriptions = null;

  String friendlyUrl = null;

  String logoPath = null;

  AddressDto address = null;

  List<BusinessHoursDto> businessHours = [];

  int rating = null;

  MediaDto media = null;

  String phoneNumber = null;

  String facebook = null;

  bool haveMenu = null;

  bool haveOrders = null;

  bool haveMana = null;
  PlaceDto();

  @override
  String toString() {
    return 'PlaceDto[instagram=$instagram, url=$url, descriptions=$descriptions, baseHookahPrice=$baseHookahPrice, currency=$currency, seats=$seats, tobaccoReviews=$tobaccoReviews, medias=$medias, haveReservation=$haveReservation, minimumReservationTime=$minimumReservationTime, franchiseId=$franchiseId, franchise=$franchise, flags=$flags, id=$id, name=$name, shortDescriptions=$shortDescriptions, friendlyUrl=$friendlyUrl, logoPath=$logoPath, address=$address, businessHours=$businessHours, rating=$rating, media=$media, phoneNumber=$phoneNumber, facebook=$facebook, haveMenu=$haveMenu, haveOrders=$haveOrders, haveMana=$haveMana, ]';
  }

  PlaceDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    instagram = json['Instagram'];
    url = json['Url'];
    descriptions = json['Descriptions'];
    baseHookahPrice = json['BaseHookahPrice'];
    currency = json['Currency'];
    seats = SeatDto.listFromJson(json['Seats']);
    tobaccoReviews = TobaccoReviewDto.listFromJson(json['TobaccoReviews']);
    medias = MediaDto.listFromJson(json['Medias']);
    haveReservation = json['HaveReservation'];
    minimumReservationTime = json['MinimumReservationTime'];
    franchiseId = json['FranchiseId'];
    franchise = new FranchiseDto.fromJson(json['Franchise']);
    flags =
        ((json['Flags'] ?? []) as List).map((item) => item as String).toList();
    id = json['Id'];
    name = json['Name'];
    shortDescriptions = json['ShortDescriptions'];
    friendlyUrl = json['FriendlyUrl'];
    logoPath = json['LogoPath'];
    address = new AddressDto.fromJson(json['Address']);
    businessHours = BusinessHoursDto.listFromJson(json['BusinessHours']);
    rating = json['Rating'];
    media = new MediaDto.fromJson(json['Media']);
    phoneNumber = json['PhoneNumber'];
    facebook = json['Facebook'];
    haveMenu = json['HaveMenu'];
    haveOrders = json['HaveOrders'];
    haveMana = json['haveMana'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Instagram': instagram,
      'Url': url,
      'Descriptions': descriptions,
      'BaseHookahPrice': baseHookahPrice,
      'Currency': currency,
      'Seats': seats,
      'TobaccoReviews': tobaccoReviews,
      'Medias': medias,
      'HaveReservation': haveReservation,
      'MinimumReservationTime': minimumReservationTime,
      'FranchiseId': franchiseId,
      'Franchise': franchise,
      'Flags': flags,
      'Id': id,
      'Name': name,
      'ShortDescriptions': shortDescriptions,
      'FriendlyUrl': friendlyUrl,
      'LogoPath': logoPath,
      'Address': address,
      'BusinessHours': businessHours,
      'Rating': rating,
      'Media': media,
      'PhoneNumber': phoneNumber,
      'Facebook': facebook,
      'HaveMenu': haveMenu,
      'HaveOrders': haveOrders,
      'HaveMana': haveMana
    };
  }

  static List<PlaceDto> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<PlaceDto>()
        : json.map((value) => new PlaceDto.fromJson(value)).toList();
  }

  static Map<String, PlaceDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlaceDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) =>
          map[key] = new PlaceDto.fromJson(value));
    }
    return map;
  }
}

part of openapi.api;

class PlaceDto {
  
  String shortDescriptions = null;
  
  String descriptions = null;
  
  double baseHookahPrice = null;
  
  String currency = null;
  
  List<SeatDto> seats = [];
  
  List<TobaccoReviewDto> tobaccoReviews = [];
  
  List<MediaDto> medias = [];
  
  bool allowReservation = null;
  
  int minimumReservationTime = null;
  
  int franchiseId = null;
  
  FranchiseDto franchise = null;
  
  List<String> flags = [];
  
  int id = null;
  
  String name = null;
  
  String friendlyUrl = null;
  
  String logoPath = null;
  
  AddressDto address = null;
  
  List<BusinessHoursDto> businessHours = [];
  
  int rating = null;
  
  String phoneNumber = null;
  
  String facebook = null;
  PlaceDto();

  @override
  String toString() {
    return 'PlaceDto[shortDescriptions=$shortDescriptions, descriptions=$descriptions, baseHookahPrice=$baseHookahPrice, currency=$currency, seats=$seats, tobaccoReviews=$tobaccoReviews, medias=$medias, allowReservation=$allowReservation, minimumReservationTime=$minimumReservationTime, franchiseId=$franchiseId, franchise=$franchise, flags=$flags, id=$id, name=$name, friendlyUrl=$friendlyUrl, logoPath=$logoPath, address=$address, businessHours=$businessHours, rating=$rating, phoneNumber=$phoneNumber, facebook=$facebook, ]';
  }

  PlaceDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    shortDescriptions = json['ShortDescriptions'];
    descriptions = json['Descriptions'];
    baseHookahPrice = json['BaseHookahPrice'];
    currency = json['Currency'];
    seats = SeatDto.listFromJson(json['Seats']);
    tobaccoReviews = TobaccoReviewDto.listFromJson(json['TobaccoReviews']);
    medias = MediaDto.listFromJson(json['Medias']);
    allowReservation = json['AllowReservation'];
    minimumReservationTime = json['MinimumReservationTime'];
    franchiseId = json['FranchiseId'];
    franchise = new FranchiseDto.fromJson(json['Franchise']);
    flags = ((json['Flags'] ?? []) as List).map((item) => item as String).toList();
    id = json['Id'];
    name = json['Name'];
    friendlyUrl = json['FriendlyUrl'];
    logoPath = json['LogoPath'];
    address = new AddressDto.fromJson(json['Address']);
    businessHours = BusinessHoursDto.listFromJson(json['BusinessHours']);
    rating = json['Rating'];
    phoneNumber = json['PhoneNumber'];
    facebook = json['Facebook'];
  }

  Map<String, dynamic> toJson() {
    return {
      'ShortDescriptions': shortDescriptions,
      'Descriptions': descriptions,
      'BaseHookahPrice': baseHookahPrice,
      'Currency': currency,
      'Seats': seats,
      'TobaccoReviews': tobaccoReviews,
      'Medias': medias,
      'AllowReservation': allowReservation,
      'MinimumReservationTime': minimumReservationTime,
      'FranchiseId': franchiseId,
      'Franchise': franchise,
      'Flags': flags,
      'Id': id,
      'Name': name,
      'FriendlyUrl': friendlyUrl,
      'LogoPath': logoPath,
      'Address': address,
      'BusinessHours': businessHours,
      'Rating': rating,
      'PhoneNumber': phoneNumber,
      'Facebook': facebook
    };
  }

  static List<PlaceDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlaceDto>() : json.map((value) => new PlaceDto.fromJson(value)).toList();
  }

  static Map<String, PlaceDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlaceDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new PlaceDto.fromJson(value));
    }
    return map;
  }
}


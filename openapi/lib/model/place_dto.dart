part of openapi.api;

class PlaceDto {
  
  int id = null;
  
  String name = null;
  
  String logoPath = null;
  
  String shortDescriptions = null;
  
  String descriptions = null;
  
  String friendlyUrl = null;
  
  int addressId = null;
  
  AddressDto address = null;
  
  List<BusinessHoursDto> businessHours = [];
  
  String phoneNumber = null;
  
  String facebook = null;
  
  double baseHookahPrice = null;
  
  String currency = null;
  
  List<SeatDto> seats = [];
  
  List<TobaccoReviewDto> tobaccoReviews = [];
  
  List<MediaDto> medias = [];
  
  bool allowReservation = null;
  
  int minimumReservationTime = null;
  
  int franchiseId = null;
  
  FranchiseDto franchise = null;
  PlaceDto();

  @override
  String toString() {
    return 'PlaceDto[id=$id, name=$name, logoPath=$logoPath, shortDescriptions=$shortDescriptions, descriptions=$descriptions, friendlyUrl=$friendlyUrl, addressId=$addressId, address=$address, businessHours=$businessHours, phoneNumber=$phoneNumber, facebook=$facebook, baseHookahPrice=$baseHookahPrice, currency=$currency, seats=$seats, tobaccoReviews=$tobaccoReviews, medias=$medias, allowReservation=$allowReservation, minimumReservationTime=$minimumReservationTime, franchiseId=$franchiseId, franchise=$franchise, ]';
  }

  PlaceDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['Id'];
    name = json['Name'];
    logoPath = json['LogoPath'];
    shortDescriptions = json['ShortDescriptions'];
    descriptions = json['Descriptions'];
    friendlyUrl = json['FriendlyUrl'];
    addressId = json['AddressId'];
    address = new AddressDto.fromJson(json['Address']);
    businessHours = BusinessHoursDto.listFromJson(json['BusinessHours']);
    phoneNumber = json['PhoneNumber'];
    facebook = json['Facebook'];
    baseHookahPrice = json['BaseHookahPrice'];
    currency = json['Currency'];
    seats = SeatDto.listFromJson(json['Seats']);
    tobaccoReviews = TobaccoReviewDto.listFromJson(json['TobaccoReviews']);
    medias = MediaDto.listFromJson(json['Medias']);
    allowReservation = json['AllowReservation'];
    minimumReservationTime = json['MinimumReservationTime'];
    franchiseId = json['FranchiseId'];
    franchise = new FranchiseDto.fromJson(json['Franchise']);
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'LogoPath': logoPath,
      'ShortDescriptions': shortDescriptions,
      'Descriptions': descriptions,
      'FriendlyUrl': friendlyUrl,
      'AddressId': addressId,
      'Address': address,
      'BusinessHours': businessHours,
      'PhoneNumber': phoneNumber,
      'Facebook': facebook,
      'BaseHookahPrice': baseHookahPrice,
      'Currency': currency,
      'Seats': seats,
      'TobaccoReviews': tobaccoReviews,
      'Medias': medias,
      'AllowReservation': allowReservation,
      'MinimumReservationTime': minimumReservationTime,
      'FranchiseId': franchiseId,
      'Franchise': franchise
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


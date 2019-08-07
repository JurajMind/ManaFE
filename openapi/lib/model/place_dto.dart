part of openapi.api;

class PlaceDto {
  
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
  
  List<SmartHookahModelsDbSocialMedia> socialMedias = [];
  
  int id = null;
  
  String name = null;
  
  Map<String, String> shortDescriptions = {};
  
  Map<String, String> description = {};
  
  String franchiseName = null;
  
  String franchiseLogo = null;
  
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
    return 'PlaceDto[url=$url, descriptions=$descriptions, baseHookahPrice=$baseHookahPrice, currency=$currency, seats=$seats, tobaccoReviews=$tobaccoReviews, medias=$medias, haveReservation=$haveReservation, minimumReservationTime=$minimumReservationTime, franchiseId=$franchiseId, franchise=$franchise, flags=$flags, socialMedias=$socialMedias, id=$id, name=$name, shortDescriptions=$shortDescriptions, description=$description, franchiseName=$franchiseName, franchiseLogo=$franchiseLogo, friendlyUrl=$friendlyUrl, logoPath=$logoPath, address=$address, businessHours=$businessHours, rating=$rating, media=$media, phoneNumber=$phoneNumber, facebook=$facebook, haveMenu=$haveMenu, haveOrders=$haveOrders, haveMana=$haveMana, ]';
  }

  PlaceDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Url'] == null) {
      url = null;
    } else {
          url = json['Url'];
    }
    if (json['Descriptions'] == null) {
      descriptions = null;
    } else {
          descriptions = json['Descriptions'];
    }
    if (json['BaseHookahPrice'] == null) {
      baseHookahPrice = null;
    } else {
          baseHookahPrice = json['BaseHookahPrice'];
    }
    if (json['Currency'] == null) {
      currency = null;
    } else {
          currency = json['Currency'];
    }
    if (json['Seats'] == null) {
      seats = null;
    } else {
      seats = SeatDto.listFromJson(json['Seats']);
    }
    if (json['TobaccoReviews'] == null) {
      tobaccoReviews = null;
    } else {
      tobaccoReviews = TobaccoReviewDto.listFromJson(json['TobaccoReviews']);
    }
    if (json['Medias'] == null) {
      medias = null;
    } else {
      medias = MediaDto.listFromJson(json['Medias']);
    }
    if (json['HaveReservation'] == null) {
      haveReservation = null;
    } else {
          haveReservation = json['HaveReservation'];
    }
    if (json['MinimumReservationTime'] == null) {
      minimumReservationTime = null;
    } else {
          minimumReservationTime = json['MinimumReservationTime'];
    }
    if (json['FranchiseId'] == null) {
      franchiseId = null;
    } else {
          franchiseId = json['FranchiseId'];
    }
    if (json['Franchise'] == null) {
      franchise = null;
    } else {
      franchise = new FranchiseDto.fromJson(json['Franchise']);
    }
    if (json['Flags'] == null) {
      flags = null;
    } else {
      flags = (json['Flags'] as List).cast<String>();
    }
    if (json['SocialMedias'] == null) {
      socialMedias = null;
    } else {
      socialMedias = SmartHookahModelsDbSocialMedia.listFromJson(json['SocialMedias']);
    }
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
    if (json['Name'] == null) {
      name = null;
    } else {
          name = json['Name'];
    }
    if (json['ShortDescriptions'] == null) {
      shortDescriptions = null;
    } else {
          shortDescriptions = (json['ShortDescriptions'] as Map).cast<String, String>();
    }
    if (json['Description'] == null) {
      description = null;
    } else {
          description = (json['Description'] as Map).cast<String, String>();
    }
    if (json['FranchiseName'] == null) {
      franchiseName = null;
    } else {
          franchiseName = json['FranchiseName'];
    }
    if (json['FranchiseLogo'] == null) {
      franchiseLogo = null;
    } else {
          franchiseLogo = json['FranchiseLogo'];
    }
    if (json['FriendlyUrl'] == null) {
      friendlyUrl = null;
    } else {
          friendlyUrl = json['FriendlyUrl'];
    }
    if (json['LogoPath'] == null) {
      logoPath = null;
    } else {
          logoPath = json['LogoPath'];
    }
    if (json['Address'] == null) {
      address = null;
    } else {
      address = new AddressDto.fromJson(json['Address']);
    }
    if (json['BusinessHours'] == null) {
      businessHours = null;
    } else {
      businessHours = BusinessHoursDto.listFromJson(json['BusinessHours']);
    }
    if (json['Rating'] == null) {
      rating = null;
    } else {
          rating = json['Rating'];
    }
    if (json['Media'] == null) {
      media = null;
    } else {
      media = new MediaDto.fromJson(json['Media']);
    }
    if (json['PhoneNumber'] == null) {
      phoneNumber = null;
    } else {
          phoneNumber = json['PhoneNumber'];
    }
    if (json['Facebook'] == null) {
      facebook = null;
    } else {
          facebook = json['Facebook'];
    }
    if (json['HaveMenu'] == null) {
      haveMenu = null;
    } else {
          haveMenu = json['HaveMenu'];
    }
    if (json['HaveOrders'] == null) {
      haveOrders = null;
    } else {
          haveOrders = json['HaveOrders'];
    }
    if (json['HaveMana'] == null) {
      haveMana = null;
    } else {
          haveMana = json['HaveMana'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (url != null)
      json['Url'] = url;
    if (descriptions != null)
      json['Descriptions'] = descriptions;
    if (baseHookahPrice != null)
      json['BaseHookahPrice'] = baseHookahPrice;
    if (currency != null)
      json['Currency'] = currency;
    if (seats != null)
      json['Seats'] = seats;
    if (tobaccoReviews != null)
      json['TobaccoReviews'] = tobaccoReviews;
    if (medias != null)
      json['Medias'] = medias;
    if (haveReservation != null)
      json['HaveReservation'] = haveReservation;
    if (minimumReservationTime != null)
      json['MinimumReservationTime'] = minimumReservationTime;
    if (franchiseId != null)
      json['FranchiseId'] = franchiseId;
    if (franchise != null)
      json['Franchise'] = franchise;
    if (flags != null)
      json['Flags'] = flags;
    if (socialMedias != null)
      json['SocialMedias'] = socialMedias;
    if (id != null)
      json['Id'] = id;
    if (name != null)
      json['Name'] = name;
    if (shortDescriptions != null)
      json['ShortDescriptions'] = shortDescriptions;
    if (description != null)
      json['Description'] = description;
    if (franchiseName != null)
      json['FranchiseName'] = franchiseName;
    if (franchiseLogo != null)
      json['FranchiseLogo'] = franchiseLogo;
    if (friendlyUrl != null)
      json['FriendlyUrl'] = friendlyUrl;
    if (logoPath != null)
      json['LogoPath'] = logoPath;
    if (address != null)
      json['Address'] = address;
    if (businessHours != null)
      json['BusinessHours'] = businessHours;
    if (rating != null)
      json['Rating'] = rating;
    if (media != null)
      json['Media'] = media;
    if (phoneNumber != null)
      json['PhoneNumber'] = phoneNumber;
    if (facebook != null)
      json['Facebook'] = facebook;
    if (haveMenu != null)
      json['HaveMenu'] = haveMenu;
    if (haveOrders != null)
      json['HaveOrders'] = haveOrders;
    if (haveMana != null)
      json['HaveMana'] = haveMana;
    return json;
  }

  static List<PlaceDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlaceDto>() : json.map((value) => new PlaceDto.fromJson(value)).toList();
  }

  static Map<String, PlaceDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlaceDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new PlaceDto.fromJson(value));
    }
    return map;
  }
}


part of openapi.api;

class PlaceSimpleDto {
  
  int id = null;
  
  String name = null;
  
  Map<String, String> shortDescriptions = {};
  
  Map<String, String> description = {};
  
  int franchiseId = null;
  
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
  
  bool haveReservation = null;
  PlaceSimpleDto();

  @override
  String toString() {
    return 'PlaceSimpleDto[id=$id, name=$name, shortDescriptions=$shortDescriptions, description=$description, franchiseId=$franchiseId, franchiseName=$franchiseName, franchiseLogo=$franchiseLogo, friendlyUrl=$friendlyUrl, logoPath=$logoPath, address=$address, businessHours=$businessHours, rating=$rating, media=$media, phoneNumber=$phoneNumber, facebook=$facebook, haveMenu=$haveMenu, haveOrders=$haveOrders, haveMana=$haveMana, haveReservation=$haveReservation, ]';
  }

  PlaceSimpleDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
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
    if (json['FranchiseId'] == null) {
      franchiseId = null;
    } else {
          franchiseId = json['FranchiseId'];
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
    if (json['HaveReservation'] == null) {
      haveReservation = null;
    } else {
          haveReservation = json['HaveReservation'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['Id'] = id;
    if (name != null)
      json['Name'] = name;
    if (shortDescriptions != null)
      json['ShortDescriptions'] = shortDescriptions;
    if (description != null)
      json['Description'] = description;
    if (franchiseId != null)
      json['FranchiseId'] = franchiseId;
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
    if (haveReservation != null)
      json['HaveReservation'] = haveReservation;
    return json;
  }

  static List<PlaceSimpleDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlaceSimpleDto>() : json.map((value) => new PlaceSimpleDto.fromJson(value)).toList();
  }

  static Map<String, PlaceSimpleDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlaceSimpleDto>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new PlaceSimpleDto.fromJson(value));
    }
    return map;
  }
}


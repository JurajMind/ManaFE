part of openapi.api;

class PlaceSimpleDto {
  
  int id = null;
  
  String name = null;
  
  String friendlyUrl = null;
  
  String logoPath = null;
  
  SmartHookahModelsAddress address = null;
  
  List<OpeningDay> businessHours = [];
  
  int rating = null;
  
  List<MediaDto> medias = [];
  PlaceSimpleDto();

  @override
  String toString() {
    return 'PlaceSimpleDto[id=$id, name=$name, friendlyUrl=$friendlyUrl, logoPath=$logoPath, address=$address, businessHours=$businessHours, rating=$rating, medias=$medias, ]';
  }

  PlaceSimpleDto.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['Id'];
    name = json['Name'];
    friendlyUrl = json['FriendlyUrl'];
    logoPath = json['LogoPath'];
    address = new SmartHookahModelsAddress.fromJson(json['Address']);
    businessHours = OpeningDay.listFromJson(json['BusinessHours']);
    rating = json['Rating'];
    medias = MediaDto.listFromJson(json['Medias']);
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'FriendlyUrl': friendlyUrl,
      'LogoPath': logoPath,
      'Address': address,
      'BusinessHours': businessHours,
      'Rating': rating,
      'Medias': medias
    };
  }

  static List<PlaceSimpleDto> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlaceSimpleDto>() : json.map((value) => new PlaceSimpleDto.fromJson(value)).toList();
  }

  static Map<String, PlaceSimpleDto> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, PlaceSimpleDto>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new PlaceSimpleDto.fromJson(value));
    }
    return map;
  }
}

